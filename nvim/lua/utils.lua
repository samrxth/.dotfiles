local M = {}

local function printf(...) print(string.format(...)) end
local sprintf = string.format
local function cmdf(...) vim.cmd(sprintf(...)) end

M.printf = printf
M.sprintf = sprintf
M.cmdf = cmdf

function M.get_cursor_pos() return {vim.fn.line('.'), vim.fn.col('.')} end

function M.debounce(func, timeout)
  local timer_id
  return function(...)
    if timer_id ~= nil then
      vim.fn.timer_stop(timer_id)
    end
    local args = {...}
    local function cb()
      func(args)
      timer_id = nil
    end
    timer_id = vim.fn.timer_start(timeout, cb)
  end
end

-- FIXME
function M.throttle(func, timeout)
  local timer_id
  local did_call = false
  return function(...)
    local args = {...}
    if timer_id == nil then
      func(unpack(args))
      local function cb()
        timer_id = nil
        if did_call then
          func(unpack(args))
          did_call = false
        end
      end
      timer_id = vim.fn.timer_start(timeout, cb)
    else
      did_call = true
    end
  end
end

-- Convert UTF-8 hex code to character
function M.u(code)
  if type(code) == 'string' then
    code = tonumber('0x' .. code)
  end
  local c = string.char
  if code <= 0x7f then
    return c(code)
  end
  local t = {}
  if code <= 0x07ff then
    t[1] = c(bit.bor(0xc0, bit.rshift(code, 6)))
    t[2] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  elseif code <= 0xffff then
    t[1] = c(bit.bor(0xe0, bit.rshift(code, 12)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  else
    t[1] = c(bit.bor(0xf0, bit.rshift(code, 18)))
    t[2] = c(bit.bor(0x80, bit.band(bit.rshift(code, 12), 0x3f)))
    t[3] = c(bit.bor(0x80, bit.band(bit.rshift(code, 6), 0x3f)))
    t[4] = c(bit.bor(0x80, bit.band(code, 0x3f)))
  end
  return table.concat(t)
end

function _G.dump(...)
  local args = {...}
  if #args == 1 then
    print(vim.inspect(args[1]))
  else
    print(vim.inspect(args))
  end
end

function M.load(path)
  local ok, mod = pcall(require, path)
  if not ok then
    printf('Error loading module `%s`', path)
    print(mod)
  else
    local loadfunc
    if mod == true then
      return
    elseif type(mod) == 'function' then
      loadfunc = mod
    elseif mod.setup ~= nil then
      loadfunc = mod.setup
    end
    local ok, err = pcall(loadfunc)
    if not ok then
      printf('Error loading module `%s`', path)
      print(err)
    end
  end
end

-- Get information about highlight group
function M.hl_by_name(hl_group)
  local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
  if hl.foreground ~= nil then
    hl.fg = sprintf('#%x', hl.foreground)
  end
  if hl.background ~= nil then
    hl.bg = sprintf('#%x', hl.background)
  end
  return hl
end

-- Define a new highlight group
-- TODO: rewrite to `nvim_set_hl()` when API will be stable
function M.highlight(cfg)
  local command = 'highlight'
  if cfg.bang == true then
    command = command .. '!'
  end
  if #cfg == 2 and type(cfg[1]) == 'string' and type(cfg[2]) == 'string' then
    -- :highlight link
    command = command .. ' link ' .. cfg[1] .. ' ' .. cfg[2]
    vim.cmd(command)
    return
  end
  local guifg = cfg.fg or cfg.guifg or cfg[2]
  local guibg = cfg.bg or cfg.guibg or cfg[3]
  local gui = cfg.gui or cfg[4]
  local guisp = cfg.guisp or cfg[5]
  if type(cfg.override) == 'string' then
    local existing = vim.api.nvim_get_hl_by_name(cfg.override, true)
    if existing.foreground ~= nil then
      guifg = sprintf('#%x', existing.foreground)
    end
    if existing.background ~= nil then
      guibg = sprintf('#%x', existing.background)
    end
    if existing.special ~= nil then
      guibg = sprintf('#%x', existing.background)
    end
    if existing.undercurl == true then
      gui = 'undercurl'
    elseif existing.underline == true then
      gui = 'underline'
    end
  end
  command = command .. ' ' .. cfg[1]
  if guifg ~= nil then
    command = command .. ' guifg=' .. guifg
  end
  if guibg ~= nil then
    command = command .. ' guibg=' .. guibg
  end
  if gui ~= nil then
    command = command .. ' gui=' .. gui
  end
  if guisp ~= nil then
    command = command .. ' guisp=' .. guisp
  end
  vim.cmd(command)
end

local autocmd_fn_index = 0

-- WIP:
function M.autocmd(event_name, pattern, callback)
  local fn_name = 'lua_autocmd' .. autocmd_fn_index
  autocmd_fn_index = autocmd_fn_index + 1
  _G[fn_name] = callback
  cmdf('autocmd %s %s call v:lua.%s()', event_name, pattern, fn_name)
end

function M.glob_exists(path) return vim.fn.empty(vim.fn.glob(path)) == 0 end

do
  local show_diagnostics = vim.lsp.diagnostic.show_line_diagnostics
  local cursor_pos = M.get_cursor_pos()
  local debounced = M.debounce(show_diagnostics, 300)
  M.show_lsp_diagnostics = function()
    local cursor_pos2 = M.get_cursor_pos()
    -- TODO: doesn't work when both diagnostics and popup is shown
    if cursor_pos[1] ~= cursor_pos2[1] and cursor_pos[2] ~= cursor_pos2[2] then
      cursor_pos = cursor_pos2
      debounced()
    end
  end
end

function M.format_code()
  if
    vim.tbl_contains(vim.g.force_neoformat_filetypes, vim.bo.filetype)
    or vim.tbl_isempty(vim.lsp.buf_get_clients(0))
  then
    vim.cmd('Neoformat')
  else
    vim.lsp.buf.formatting()
  end
end

function M.id_generator(start)
  local cnt = start or 0
  return function()
    local result = cnt
    cnt = cnt + 1
    return result
  end
end

function M.delete_bufs(include_current)
  local cur = vim.api.nvim_get_current_buf()
  for _, h in ipairs(vim.api.nvim_list_bufs()) do
    if (
      (h ~= cur or include_current) and
      vim.api.nvim_buf_is_loaded(h)
    ) then vim.api.nvim_buf_delete(h, {}) end
  end
end

local map_func_counter = 0
function M.map(mode, lhs, fn, opts)
  local name = 'map_func_' .. map_func_counter
  _G[name] = fn
  local rhs = ':call v:lua.' .. name .. '()<CR>'
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  map_func_counter = map_func_counter + 1
end

for _, mode in ipairs {'', 'n', 'i', 'c', 'x'} do
  M[mode .. 'noremap'] = function(lhs, fn, opts)
    local mapopts = opts or {}
    mapopts.noremap = true
    return M.map(mode, lhs, fn, mapopts)
  end
end

function M.log_time(fn, label)
  return function(...)
    local now = os.clock()
    fn(...)
    print(
      ((label and (label .. ' ')) or '') ..
      (math.floor((os.clock() - now) * 1e6) / 1000) ..
      "ms."
    )
  end
end

return M
