vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·" -- white characters
vim.opt.colorcolumn = "120"
vim.opt.smartindent = true
vim.opt.scrolloff = 6
vim.opt.wrap = false

vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.termguicolors = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.updatetime = 50

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd[[colorscheme tokyonight-moon]]

