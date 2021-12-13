local snap = require("snap")
snap.maps({
  { "<Leader>ff", snap.config.file({ producer = "ripgrep.file" }) },
  { "<Leader>fb", snap.config.file({ producer = "vim.buffer" }) },
  { "<Leader>fo", snap.config.file({ producer = "vim.oldfile" }) },
  { "<Leader>fi", snap.config.vimgrep({}) },
})
