vim.opt.relativenumber = true
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣" -- white characters

lvim.lsp.diagnostics.virtual_text = false

lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "float"

lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

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


require("user.linters").config()
require("user.formatters").config()
require("user.keymappings").config()
require("user.plugins").config()


require('dapui').setup()

require('dap-python').setup('~/Library/Caches/pypoetry/virtualenvs/lvim-_NmbRTpQ-py3.11/bin/python')
table.insert(require('dap').configurations.python,
  {
    type = 'python',
    module = 'train',
    request = 'launch',
    name = 'Launch the module',
    cwd = ''
  }
)

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("lsp_signature").setup()
require("symbols-outline").setup({ width = 10, })
require('neoscroll').setup()
