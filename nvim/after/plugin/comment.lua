require("Comment").setup()

local api = require("Comment.api")
vim.keymap.set("n", "<leader>/", api.toggle.linewise.current)
