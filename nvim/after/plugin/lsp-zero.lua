local lsp = require("lsp-zero").preset("recommended")

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
-- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
lsp.ensure_installed({
  "bashls",
  "lua_ls",
  "rust_analyzer",
  "pylsp",
  "gopls",

  "dockerls",
  "docker_compose_language_service",
  "html",
  "jsonls",
  "vimls",
  "yamlls",
  "taplo",
  "sqlls",
  "marksman",
  "ltex"
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup()

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        autopep8 = { enabled = false },
        flake8 = { enabled = false },
        mccabe = { enabled = false },
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        yapf = { enabled = false },
      }
    }
  }
}

require('lspconfig').taplo.setup {
  settings = {
    toml = {
      schemas = {
        ['http://json.schemastore.org/ruff'] = './*.{toml}',
      },
    },
  }
}
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ['http://json.schemastore.org/pre-commit-config'] = './.pre-commit-config.{yml,yaml}',
        ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
        ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
      },
    },
  }
}

local null_ls = require("null-ls")

null_ls.setup({
  diagnostics_format = "(#{s}) #{m} [#{c}] ",
  sources = {
    null_ls.builtins.formatting.stylua,

    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.ruff,

    null_ls.builtins.formatting.gofumpt,

    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.shellcheck,

    null_ls.builtins.completion.spell,

    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace,
  },
})

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
