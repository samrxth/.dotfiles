vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
	a = {
		description = { '  Recently Opened Files          SPC f o' },
		command = 'Telescope oldfiles',
	},
  b = {
		description = { '  Find File                      SPC f f' },
		command = 'Telescope find_files',
	},
	c = {
		description = { '  Open Private Configuration     SPC d c' },
		command = ':e ~/.config/nvim/init.vim',
	},
}

