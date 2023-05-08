require("which-key").setup({
  window = {
    border = "single",
  }
})

local n_mappings = {
  q = { "<cmd>wa<cr><cmd>qa<cr>", "Quit" },
  c = { "<cmd>lua Buf_kill()<cr>", "Close Buffer" },

  ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Comment" },

  h = {
    name = "+harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
    t = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Menu" },
    ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Go to File 1" },
    ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Go to File 2" },
    ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Go to File 3" },
    ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Go to File 4" },
    ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "Go to File 5" },
    ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "Go to File 6" },
    ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "Go to File 7" },
    ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "Go to File 8" },
    ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "Go to File 9" },
    ["0"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", "Go to File 10" },
  },

  H = {
    name = "+hop",
    a = { "<cmd>HopAnywhere<cr>", "Hop Anywhere" },
    w = { "<cmd>HopWord<cr>", "Hop Word" },
    c = { "<cmd>HopChar1<cr>", "Hop Char" },
  },

  g = { "<cmd>LazyGit<cr>", "LazyGit" },

  d = {
    name = "+dap",
    p = {
      name = "+python",
      m = { "<cmd>lua require('dap-python').test_method({ config = { justMyCode = false } })<cr>", "Test Method" },
      c = { "<cmd>lua require('dap-python').test_class({ config = { justMyCode = false } })<cr>", "Test Class" },
      s = { "<cmd>lua require('dap-python').debug_selection({ config = { justMyCode = false } })<cr>", "Debug Selection" },
    },
    g = {
      name = "+go",
      m = { "<cmd>lua require('dap-go').debug_test()<cr>", "Test method" },
      l = { "<cmd>lua require('dap-go').debug_last_test()<cr>", "Test last method" },
    },
    u = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Breakpoint" },
    T = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional breakpoint" },
  },

  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

  p = { "<cmd>Telescope projects<cr>", "Projects" },

  f = {
    name = "+find",
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    F = { "<cmd>Telescope git_files<cr>", "Git Files" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
    T = { "<cmd>TodoTelescope<cr>", "TODOs" },
  },

  u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },

  r = { ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", "Replace all" },

  n = { "<cmd>noh<cr>", "No highlight" },

  P = { "<cmd>PackerSync<cr>", "Packer Sync" },

  w = { "<cmd>w<cr>", "Write" },
}

local n_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local v_mappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)<CR>", "Comment" },
}

local v_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local wk = require("which-key")
wk.register(n_mappings, n_opts)
wk.register(v_mappings, v_opts)
