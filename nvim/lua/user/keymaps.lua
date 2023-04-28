vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex) -- explorer
vim.keymap.set("n", "<leader>h", ":nohl<CR>") -- no highlight

vim.keymap.set("n", "<C-l>", "<C-w>l") -- left buffer
vim.keymap.set("n", "<C-h>", "<C-w>h") -- right buffer

vim.keymap.set("n", "<C-j>", "<C-w>j") -- left buffer
vim.keymap.set("n", "<C-k>", "<C-w>k") -- right buffer

vim.keymap.set("n", "<S-C-k>", ":m -2<cr>") -- move line up
vim.keymap.set("n", "<S-C-j>", ":m +1<cr>") -- move line down

vim.keymap.set("v", "<S-C-k>", ":m '<-2<CR>gv=gv") -- move selection up
vim.keymap.set("v", "<S-C-j>", ":m '>+1<CR>gv=gv") -- move selection down

vim.keymap.set("x", "<leader>p", '"_dP') -- paste without replacing content in the clipboard

vim.keymap.set("n", "J", "mzJ`z") -- paste without replacing content in the clipboard
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("v", "<", "<gv") -- after reindent, keep the selection
vim.keymap.set("v", ">", ">gv") -- after reindent, keep the selection
