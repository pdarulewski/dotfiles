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

	dap_python.setup("uv")
	dap_python.test_runner = "pytest"
	dap.configurations.python = {}

	local ok, dap_go = pcall(require, "dap-go")
	if not ok then
		return
	end

	dap_go.setup()

	local adapter = dap.adapters.go
	dap.adapters.go = function(cb, config)
		if config and config.request == "launch" and not config.outputMode then
			config.outputMode = "remote"
		end
		if type(adapter) == "function" then
			adapter(cb, config)
		else
			cb(adapter)
		end
	end

	local ok_vscode, dap_vscode = pcall(require, "dap.ext.vscode")
	if ok_vscode then
		local orig_load_launchjs = dap_vscode.load_launchjs
		dap_vscode.load_launchjs = function(path, type_to_filetypes)
			orig_load_launchjs(path, type_to_filetypes)
			if dap.configurations.go then
				for _, config in ipairs(dap.configurations.go) do
					if config.request == "launch" and not config.outputMode then
						config.outputMode = "remote"
					end
				end
			end
		end
	end

	dap.configurations.go = nil

	dap.providers.configs["0_attach_container"] = function(bufnr)
		return {
			{
				name = "🐳 attach to container",
				type = "go",
				mode = "remote",
				outputMode = "remote",
				request = "attach",
				host = "127.0.0.1",
				port = 9000,
			},
		}
	end

	dap.providers.configs["0_attach_air"] = function(bufnr)
		return {
			{
				name = "☁️ attach to air",
				type = "go",
				mode = "remote",
				outputMode = "remote",
				request = "attach",
				host = "127.0.0.1",
				port = 9999,
			},
		}
	end

	dap.providers.configs["0_go_file"] = function(bufnr)
		return {
			{
				name = "🦫 run current go file",
				type = "go",
				request = "launch",
				program = "${file}",
				outputMode = "remote",
			},
		}
	end
end

return M
