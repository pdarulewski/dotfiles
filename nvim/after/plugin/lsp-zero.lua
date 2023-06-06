local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lsp.preset({})

lsp.ensure_installed({
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
})

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>")

vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()

-- format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
