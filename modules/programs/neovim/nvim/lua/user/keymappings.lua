-- remaining keymappings

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- keep cursor in place while removing newlines with J
map("n", "J", "mzJ`z", opts)

map("x", "<Tab>", ">gv", opts)
map("x", "<S-Tab>", "<gv", opts)

-- center while moving up and down
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- resize windows
map("n", "<C-S-h>", ":vertical res +2<CR>", opts)
map("n", "<C-S-j>", ":res -2<CR>", opts)
map("n", "<C-S-k>", ":res +2<CR>", opts)
map("n", "<C-S-l>", ":vertical res -2<CR>", opts)

-- save buffer
map("i", "jk", "<ESC>:wa<cr>", opts)
map("i", "kj", "<ESC>:wa<cr>", opts)
map("i", "jj", "<ESC>:wa<cr>", opts)

-- smart deletion, dd
-- It solves the issue, where you want to delete empty line, but dd will override you last yank.
-- Code above will check if u are deleting empty line, if so - use black hole register.
-- [src: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3]
local function smart_dd()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end

map("n", "dd", smart_dd, { noremap = true, expr = true })
