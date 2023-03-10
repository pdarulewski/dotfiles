vim.opt.relativenumber = true
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣" -- white characters
vim.opt.colorcolumn = "120"

lvim.lsp.diagnostics.virtual_text = false

lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "nord"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.transparent_window = true

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "float"

lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.filters.custom = {
  "__pycache__",
  ".DS_Store",
  ".mypy_cache",
  ".pytest_cache",
  ".git$",
}

vim.api.nvim_set_option("foldmethod", "indent") -- fold object by indent
vim.api.nvim_set_option("foldlevel", 99)

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true


require("user.debugging").config()

require("user.linters").config()
require("user.formatters").config()
require("user.keymappings").config()
require("user.plugins").config()


require("lsp_signature").setup()
require("symbols-outline").setup({ width = 10, })
require('neoscroll').setup()
