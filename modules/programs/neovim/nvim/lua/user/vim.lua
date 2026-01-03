vim.o.nu = true -- line numbers
vim.o.relativenumber = true -- relative line numbers

vim.o.list = true -- white characters
vim.o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"

-- vim.o.winborder = "rounded"

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

-- Folding https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
vim.o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
vim.o.foldcolumn = "1"
vim.o.foldenable = true

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- vim.o.foldlevel = 99
vim.o.foldlevelstart = 0
vim.o.foldnestmax = 10
vim.o.foldtext = "" -- syntax highlight the fold
-- vim.o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)).' ('.string(v:foldend-v:foldstart+1).' lines)']]

vim.opt.fillchars = {
	vert = "▕", -- alternatives │
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.o.cmdheight = 0 -- disable space between tmux and lualine

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	float = {
		border = "rounded",
	},
})

vim.g.gh_repo_map = "±"
vim.g.gh_line_map_default = 0
vim.g.gh_line_blame_map_default = 0

vim.cmd("set shell=zsh")
