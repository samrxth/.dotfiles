local g = vim.g

g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
"",
"",
"   ▄████▄        ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒",
"  ███▄█▀        ▒─▄▒─▄▒  ▒─▄▒─▄▒  ▒─▄▒─▄▒  ▒─▄▒─▄▒",
" ▐████  █  █    ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒",
"  █████▄        ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒",
"    ████▀       ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒  ▒ ▒ ▒ ▒",
"",
"",
"",
"",
"",
""
}
 --
g.dashboard_custom_section = {
    a = {description = {"📁  Find File                 SPC f f"}, command = "Telescope find_files"},
    b = {description = {"  Recents                   SPC f o"}, command = "Telescope oldfiles"},
    c = {description = {"  Find Word                 SPC f w"}, command = "Telescope live_grep"},
    d = {description = {"洛 New File                  SPC f n"}, command = "DashboardNewFile"},
    e = {description = {"洛 New buffer                SPC g g"}, command = ":enew"},
    f = {description = {"💻  Go to configuration       SPC f w"}, command = ":e ~/.config/nvim/init.lua"},
}

g.dashboard_custom_footer = {
    "   ",
    "Neovim v0.6"
}
 --
