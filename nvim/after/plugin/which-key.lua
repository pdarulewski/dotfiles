local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

which_key.setup({
  window = {
    border = "single",
  }
})

local n_leader_mappings = {
  q = { "<cmd>wa<cr><cmd>qa<cr>", "Quit" },
  c = { "<cmd>bp|bd #<cr>", "Close Buffer" },

  ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", "Comment" },

  h = {
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
    f = { "<cmd>Telescope find_files hidden=true<cr>", "Files" },
    F = { "<cmd>Telescope git_files hidden=true<cr>", "Git Files" },
    t = { "<cmd>Telescope live_grep hidden=true<cr>", "Text" },
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

local n_leader_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local v_leader_mappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)<CR>", "Comment" },
}

local v_leader_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

which_key.register(n_leader_mappings, n_leader_opts)
which_key.register(v_leader_mappings, v_leader_opts)
