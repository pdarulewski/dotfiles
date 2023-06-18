local ok, refactoring = pcall(require, "refactoring")
if not ok then
  return
end

require('refactoring').setup({
  prompt_func_return_type = {
    go = true,
  },
  prompt_func_param_type = {
    go = true,
  },
  printf_statements = {},
  print_var_statements = {},
})
