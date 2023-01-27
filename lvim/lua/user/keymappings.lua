local M = {}

M.config = function()

  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

  lvim.keys.normal_mode["<C-k>"] = ":m -2<cr>"
  lvim.keys.normal_mode["<C-j>"] = ":m +1<cr>"

  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    s = { "<cmd>SymbolsOutline<cr>", "Symbols toggle" },
  }

  lvim.keys.normal_mode["<F2>"] = ":lua require'dap'.continue()<CR>"
  lvim.keys.normal_mode["<F3>"] = ":lua require'dap'.step_into()<CR>"
  lvim.keys.normal_mode["<F4>"] = ":lua require'dap'.step_over()<CR>"
  lvim.keys.normal_mode["<F5>"] = ":lua require'dap'.step_out()<CR>"
  lvim.keys.normal_mode["<F6>"] = ":lua require'dap'.close()<CR>"
  lvim.keys.normal_mode["<F7>"] = ":lua require'dap'.restart()<CR>"
  lvim.keys.normal_mode["<F8>"] = ":lua require'lsp_signature'.toggle_key()<CR>"

end

return M
