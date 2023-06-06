-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
local ok, neodev = pcall(require, "neodev")
if not ok then
  return
end

neodev.setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- toml schemas
lspconfig.taplo.setup {
  settings = {
    toml = {
      schemas = {
        ['http://json.schemastore.org/ruff'] = './*.{toml}',
      },
    },
  }
}

-- yaml schemas
lspconfig.yamlls.setup {
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
