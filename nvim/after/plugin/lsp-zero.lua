local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
end)


lsp.setup_servers({
  "gopls",
  "pyright",
  "rust_analyzer",
  "lua_ls",
})

lsp.setup()
--
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup()

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
        ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
        ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
        ['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
        ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}'
      },
    },
  }
}
