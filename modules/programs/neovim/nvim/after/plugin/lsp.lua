vim.lsp.enable({
  "bashls",
  "buf_ls",
  "clangd",
  "docker_compose_language_service",
  "docker_language_server",
  "dockerls",
  "gopls",
  "html",
  "ltex",
  "lua_ls",
  "marksman",
  "nil_ls",
  "ruff",
  "taplo",
  "terraformls",
  "ty",
  "yamlls",
  "zls",
})

vim.lsp.config['zls'] = {
  settings = {
    zls = {
      enable_build_on_save = true,
    }
  },
}
