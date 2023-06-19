local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "simrat39/rust-tools.nvim",
  }
}

M.config = function()
  local ok, dap = pcall(require, "dap")
  if not ok then
    return
  end

  vim.keymap.set("n", "<F2>", function() require('dap').step_into() end)
  vim.keymap.set("n", "<F3>", function() require('dap').step_over() end)
  vim.keymap.set("n", "<F4>", function() require('dap').step_out() end)
  vim.keymap.set("n", "<F5>", function() require('dap').continue() end)
  vim.keymap.set("n", "<F6>", function() require('dap').restart() end)
  vim.keymap.set("n", "<F7>", function() require('dap').close() end)


  local ok, dap_python = pcall(require, "dap-python")
  if not ok then
    return
  end

  dap_python.setup('/Users/pd/Library/Caches/pypoetry/virtualenvs/debug-oOkcC5sn-py3.11/bin/python')
  dap_python.test_runner = "pytest"
  dap.configurations.python = {}

  local ok, dap_go = pcall(require, "dap-go")
  if not ok then
    return
  end

  dap_go.setup()
  dap.configurations.go = {}

  local ok, rust_tools = pcall(require, "rust-tools")
  if not ok then
    return
  end

  local codelldb_path = '/Users/pd/.local/share/codelldb/extension/adapter/codelldb'
  local liblldb_path = '/Users/pd/.local/share/codelldb/extension/lldb/lib/liblldb.dylib'

  local opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<F8>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      end,
    },
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    }
  }

  rust_tools.setup(opts)

  local ok, vscode = pcall(require, "dap.ext.vscode")
  if not ok then
    return
  end

  vscode.load_launchjs(nil, { rt_lldb = { 'rust' } })
end

return M
