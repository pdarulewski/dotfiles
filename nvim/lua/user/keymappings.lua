local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- buffer navigation
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- move lines up and down
map("n", "<S-C-k>", ":m -2<cr>", opts)
map("n", "<S-C-j>", ":m +1<cr>", opts)
map("v", "<S-C-k>", ":m '<-2<CR>gv=gv", opts)
map("v", "<S-C-j>", ":m '>+1<CR>gv=gv", opts)

-- paste without replacing content in the clipboard
map("x", "<leader>p", '"_dP', opts)

-- keep cursor in place while J
map("n", "J", "mzJ`z", opts)

map("x", "<Tab>", ">gv", opts)
map("x", "<S-Tab>", "<gv", opts)

-- center while moving up and down
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

map("n", "<C-Up>", ":res +2<CR>", opts)
map("n", "<C-Down>", ":res -2<CR>", opts)
map("n", "<C-Left>", ":vertical res +2<CR>", opts)
map("n", "<C-Right>", ":vertical res -2<CR>", opts)

map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)
map("i", "jj", "<ESC>", opts)

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
