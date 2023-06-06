local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

null_ls.setup({
  diagnostics_format = "(#{s}) #{m} [#{c}] ",
  sources = {
    -- general
    null_ls.builtins.formatting.trim_newlines,
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.completion.spell,

    null_ls.builtins.formatting.stylua,

    -- python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,

    null_ls.builtins.diagnostics.ruff,
    -- go
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.diagnostics.golangci_lint,

    -- rust
    null_ls.builtins.formatting.rustfmt,

    null_ls.builtins.diagnostics.shellcheck,
  },
})
