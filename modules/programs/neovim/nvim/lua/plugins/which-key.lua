-- keymaps with a window after the leader key

local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {
		"echasnovski/mini.icons",
	},
}

M.config = function()
	local ok, which_key = pcall(require, "which-key")
	if not ok then
		return
	end

	which_key.setup({
		win = {
			border = "single",
		},
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
		},
	})

	local n_leader_mappings = {
		mode = "n",
		-- Basic
		{ "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Comment" },

		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
		{ "<leader>E", "<cmd>lua require('oil').open_float()<cr>", desc = "Explorer" },

		{ "<leader>W", "<cmd>noautocmd w<cr>", desc = "Write without saving" },
		{ "<leader>c", "<cmd>bp|bd #<cr>", desc = "Close Buffer" },
		{ "<leader>n", "<cmd>noh<cr>", desc = "No highlight" },
		{ "<leader>w", "<cmd>set wrap!<cr>", desc = "Toggle wrap" },
		{ "<leader>q", "<cmd>wa<cr><cmd>qa<cr>", desc = "Quit" },

		{ "<leader>F", "<cmd> lua require('telescope').extensions.refactoring.refactors()<cr>", desc = "Refactor" },

		{ "<leader>s", "<cmd>Outline<cr>", desc = "Symbols" },
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
		{ "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" },

		{ "<leader>ll", "<cmd>lua gh_open_in_browser()<cr>", desc = "Open GitHub" },
		{ "<leader>lc", "<cmd>lua gh_copy_to_clipboard()<cr>", desc = "Copy link GitHub" },

		-- Meta
		{ "<leader>1", group = "+settings" },
		{ "<leader>1n", "<cmd>lua require('notify').dismiss()<cr>", desc = "Dismiss notifications" },
		{ "<leader>1i", "<cmd>Inspect<cr>", desc = "Inspect treesitter object" },
		{ "<leader>1L", "<cmd>Lazy<cr>", desc = "Lazy" },
		{ "<leader>1M", "<cmd>Mason<cr>", desc = "Mason" },
		{ "<leader>1I", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", desc = "Mason" },

		-- Python
		{ "<leader>P", group = "+python" },
		{ "<leader>Pv", "<cmd>VenvSelect<cr>", desc = "Select venv" },
		{
			"<leader>Pm",
			"<cmd>lua require('dap-python').test_method({ config = { justMyCode = false } })<cr>",
			desc = "Test Method",
		},
		{
			"<leader>Pc",
			"<cmd>lua require('dap-python').test_class({ config = { justMyCode = false } })<cr>",
			desc = "Test Class",
		},

		-- Go
		{ "<leader>G", group = "+go" },
		{ "<leader>Gm", "<cmd>lua require('dap-go').debug_test()<cr>", desc = "Test method" },

		-- Rust
		{ "<leader>R", group = "+rust" },
		{ "<leader>Rd", "<cmd>RustLsp debuggables<cr>", desc = "rust" },

		{ "<leader>h", group = "Hop" },
		{ "<leader>hh", "<cmd>HopAnywhere<cr>", desc = "Hop Anywhere" },
		{ "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop Word" },
		{ "<leader>hc", "<cmd>HopChar1<cr>", desc = "Hop Char" },

		{ "<leader>d", group = "+dap" },
		{ "<leader>du", "<cmd>lua require('dapui').toggle({ reset = true })<cr>", desc = "Toggle UI" },
		{
			"<leader>dR",
			"<cmd>lua require('dapui').close()<cr><cmd>lua require('dapui').toggle({ reset = true })<cr>",
			desc = "Toggle UI",
		},
		{ "<leader>dc", "<cmd>lua require('dapui').close()<cr>", desc = "Close UI" },
		{ "<leader>de", "<cmd>lua require('dapui').eval()<cr>", desc = "Evaluate" },
		{ "<leader>dt", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Breakpoint" },
		{
			"<leader>dT",
			"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
			desc = "Conditional breakpoint",
		},

		{ "<leader>D", group = "+Dbee" },
		{ "<leader>DD", "<cmd>Dbee toggle<cr>", desc = "Toggle Dbee" },
		{ "<leader>Ds", "<cmd>lua require('dbee').store('csv', 'output.csv', {})<cr>", desc = "store in csv" },

		{ "<leader>f", group = "+find" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>ff", "<cmd>Telescope git_files hidden=true<cr>", desc = "Git Files" },
		{ "<leader>fF", "<cmd>Telescope find_files hidden=true<cr>", desc = "Files" },
		{ "<leader>fp", "<cmd>Telescope live_grep search_dirs=./.venv hidden=true<cr>", desc = "In project" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
		{ "<leader>ft", "<cmd>Telescope live_grep hidden=true<cr>", desc = "Text" },
		{ "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "TODOs" },
		{ "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy search here" },

		{ "<leader>t", group = "+trouble" },
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble" },

		{
			"<leader>wc",
			"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
			desc = "Create",
		},
		{ "<leader>wl", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "List" },

		{ "<leader>r", group = "+rest" },
		{ "<leader>rr", "<cmd>Rest run<cr>", desc = "Run" },
		{ "<leader>rl", "<cmd>Rest last<cr>", desc = "Run last" },
	}

	local v_leader_mappings = {
		mode = "v",
		{ "<leader>/", "<Plug>(comment_toggle_linewise_visual)<CR>", desc = "Comment" },

		{ "<leader>p", '"_dP', desc = "paste and keep" },
		{ "<leader>P", '"_dp', desc = "paste and keep" },

		{ "<leader>F", "<cmd> lua require('telescope').extensions.refactoring.refactors()<cr>", desc = "Refactor" },

		{ "<leader>d", group = "+dap" },
		{ "<leader>du", "<cmd>lua require('dapui').toggle({ reset = true })<cr>", desc = "Toggle UI" },
		{
			"<leader>dr",
			"<cmd>lua require('dapui').close()<cr><cmd>lua require('dapui').toggle({ reset = true })<cr>",
			desc = "Toggle UI",
		},
		{ "<leader>dc", "<cmd>lua require('dapui').close()<cr>", desc = "Close UI" },

		{ "<leader>P", group = "+python" },
		{
			"<leader>Ps",
			"<cmd>lua require('dap-python').debug_selection({ config = { justMyCode = false } })<cr>",
			desc = "Debug Selection",
		},

		{ "<leader>v", group = "+vim" },
		{ "<leader>vs", ":'<,'>sort<cr>", desc = "Sort" },
		{ "<leader>vS", ":'<,'>sort!<cr>", desc = "Sort inverse" },
		{ "<leader>vd", ":'<,'>sort u<cr>", desc = "Delete duplicated lines" },
		{ "<leader>vr", ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", desc = "Replace all" },
	}

	which_key.add(n_leader_mappings)
	which_key.add(v_leader_mappings)
end

return M
