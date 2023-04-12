local M = {}

M.config = function()
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

  -- lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
  -- lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

  -- write a lunar vim mapping for changing copilot access suggestion key
  lvim.keys.normal_mode["<C-,>"] = "copilot#Accept(<CR>)"

  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

  lvim.keys.visual_mode["<C-k>"] = ":m '<-2<CR>gv=gv" -- move selection up
  lvim.keys.visual_mode["<C-j>"] = ":m '>+1<CR>gv=gv" -- move selection down

  lvim.keys.normal_mode["<C-k>"] = ":m -2<cr>" -- move line up
  lvim.keys.normal_mode["<C-j>"] = ":m +1<cr>" -- move line down

  lvim.keys.visual_mode["<C-p>"] = "\"_dP" -- paste without replacing content in the clipboard

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
    t = { "<cmd>TodoTelescope<cr>", "TODO list" },
  }

  lvim.keys.normal_mode["<F2>"] = ":lua require'dap'.step_into()<CR>"
  lvim.keys.normal_mode["<F3>"] = ":lua require'dap'.step_over()<CR>"
  lvim.keys.normal_mode["<F4>"] = ":lua require'dap'.step_out()<CR>"
  lvim.keys.normal_mode["<F5>"] = ":lua require'dap'.continue()<CR>"
  lvim.keys.normal_mode["<F6>"] = ":lua require'dap'.restart()<CR>"
  lvim.keys.normal_mode["<F7>"] = ":lua require'dap'.close()<CR>"
  lvim.keys.normal_mode["<F8>"] = ":lua require'lsp_signature'.toggle_key()<CR>"

  lvim.builtin.which_key.mappings["dT"] = {
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Conditional Breakpoint"
  }

  lvim.builtin.which_key.mappings["dx"] = {
    name = "+Python debug",
    m = { "<cmd>lua require('dap-python').test_method()<cr>", "Test method" },
    c = { "<cmd>lua require('dap-python').test_class()<cr>", "Test class" },
    S = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug selection" },
  }

  lvim.builtin.which_key.mappings["S"] = { "<cmd>SymbolsOutline<CR>", "Symbols" }
  lvim.builtin.which_key.mappings["\\"] = { "<cmd>ToggleTerm<CR>", "Toggle Term" }
  -- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
  -- nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
  -- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
end

return M
