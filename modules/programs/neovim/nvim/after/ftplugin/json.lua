vim.cmd("setlocal tabstop=2 shiftwidth=2 expandtab")
vim.treesitter.start()

vim.bo.formatexpr = ""
vim.bo.formatprg = "jq"
