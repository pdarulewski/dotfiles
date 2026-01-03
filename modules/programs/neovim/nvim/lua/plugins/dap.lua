-- debugging configuration per language

local M = {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
}

M.config = function()
	local ok, dap = pcall(require, "dap")
	if not ok then
		return
	end

	vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#ff476f", bg = "#394b70" })
	vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#82aaff", bg = "#394b70" })
	vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#96eab0", bg = "#394b70" })

	vim.fn.sign_define(
		"DapBreakpoint",
		{ text = "󰃤", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointCondition",
		{ text = "󰨮", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapBreakpointRejected",
		{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
	)
	vim.fn.sign_define(
		"DapLogPoint",
		{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
	)
	vim.fn.sign_define(
		"DapStopped",
		{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
	)

	vim.keymap.set("n", "<F2>", function()
		require("dap").step_into()
	end)
	vim.keymap.set("n", "<F3>", function()
		require("dap").step_over()
	end)
	vim.keymap.set("n", "<F4>", function()
		require("dap").step_out()
	end)
	vim.keymap.set("n", "<F5>", function()
		require("dap").continue()
	end)
	vim.keymap.set("n", "<F6>", function()
		require("dap").restart()
	end)
	vim.keymap.set("n", "<F7>", function()
		require("dap").close()
	end)
	vim.keymap.set("n", "<F8>", function()
		require("dap").run_last()
	end)

	local ok, dap_python = pcall(require, "dap-python")
	if not ok then
		return
	end

	dap_python.setup("/Users/pd/dev/debug/.venv/bin/python")
	dap_python.test_runner = "pytest"
	dap.configurations.python = {}

	local ok, dap_go = pcall(require, "dap-go")
	if not ok then
		return
	end

	dap_go.setup()

	dap.configurations.go = nil

	dap.adapters.delve = function(callback, config)
		callback({
			outputMode = "remote",
		})
	end

	dap.providers.configs["air"] = function(bufnr)
		return {
			{
				name = "attach to air",
				type = "go",
				mode = "remote",
				outputMode = "remote",
				request = "attach",
				host = "127.0.0.1",
				port = 9999,
			},
		}
	end

	dap.providers.configs["gofile"] = function(bufnr)
		return {
			{
				name = "run current go file",
				type = "go",
				request = "launch",
				program = "${file}",
				outputMode = "remote",
			},
		}
	end
end

return M
