local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pF", builtin.find_files)
vim.keymap.set("n", "<leader>pf", builtin.git_files)
vim.keymap.set("n", "<leader>st", builtin.live_grep)

vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
