local eslint = {
  sourceName = "eslint",
  command = "eslint_d",
  rootPatterns = { ".eslintrc.js", "package.json" },
  debounce = 100,
  args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
  parseJson = {
    errorsRoot = "[0].messages",
    line = "line",
    column = "column",
    endLine = "endLine",
    endColumn = "endColumn",
    message = "${message} [${ruleId}]",
    security = "severity",
  },
  securities = { [2] = "error", [1] = "warning" },
}
local flake = require("diagnosticls-configs.linters.flake8")
local luacheck = require("diagnosticls-configs.linters.luacheck")
local dlsconfig = require("diagnosticls-configs")

dlsconfig.init({})
dlsconfig.setup({
  ["javascript"] = {
    linter = eslint,
  },
  ["javascriptreact"] = {
    linter = eslint,
  },
  ["typescript"] = {
    linter = eslint,
  },
  ["typescriptreact"] = {
    linter = eslint,
  },
  ["python"] = {
    linter = flake,
  },
  ["lua"] = {
    linter = luacheck,
  },
})
