vim.o.nu = true
vim.o.relativenumber = true
vim.o.list = true
vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·" -- white characters
vim.o.colorcolumn = "120"
vim.o.smartindent = true
vim.o.scrolloff = 6
vim.o.wrap = false
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.autowrite = true
vim.o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.o.mouse = "a"
vim.o.termguicolors = true

vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
vim.o.swapfile = false

vim.o.updatetime = 50

vim.o.history = 10000
vim.o.undolevels = 1000

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

vim.opt.fillchars = {
  vert = "▕", -- alternatives │
  fold = " ",
  eob = " ",  -- suppress ~ at EndOfBuffer
  diff = "╱", -- alternatives = ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

-- vim.o.foldcolumn = "0"
vim.o.foldmethod = "indent"

vim.cmd 'set shell=zsh'
