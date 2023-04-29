require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "lua_ls",
    "rust_analyzer",
    "pyright",
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
  },
})
