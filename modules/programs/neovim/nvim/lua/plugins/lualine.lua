-- bottom statusline

local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

M.config = function()
	local ok, lualine = pcall(require, "lualine")
	if not ok then
		return
	end

	local lint_progress = function()
		local linters = require("lint").get_running()
		if #linters == 0 then
			return "󰦕"
		end
		return table.concat(linters, ", ") .. " 󱉶"
	end

	local active_formatters = function()
		local formatters = require("conform").list_formatters(0)
		local names = {}
		for _, formatter in ipairs(formatters) do
			table.insert(names, formatter.name)
		end
		return table.concat(names, " ♦ ")
	end

	local debugger = function()
		return require("dap").status()
	end

	-- Bubbles config for lualine
	-- Author: lokesh-krishna
	-- MIT license, see LICENSE for more details.
	-- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/bubbles.lua

	local colors = {
		blue = "#3e8fb0",
		cyan = "#9ccfd8",
		black = "#1f1d2e",
		white = "#e0def4",
		red = "#eb6f92",
		violet = "#c4a7e7",
		grey = "#2a273f",
	}

	local bubbles_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.violet },
			b = { fg = colors.white, bg = colors.grey },
			c = { fg = colors.white },
			y = { fg = colors.black, bg = colors.cyan },
			z = { fg = colors.black, bg = colors.violet },
		},

		insert = {
			a = { fg = colors.black, bg = colors.blue },
			z = { fg = colors.black, bg = colors.blue },
		},
		visual = {
			a = { fg = colors.black, bg = colors.cyan },
			z = { fg = colors.black, bg = colors.cyan },
		},
		replace = {
			a = { fg = colors.black, bg = colors.red },
			z = { fg = colors.black, bg = colors.red },
		},

		inactive = {
			a = { fg = colors.white, bg = colors.black },
			b = { fg = colors.white, bg = colors.black },
			c = { fg = colors.white },
		},
	}

	lualine.setup({
		options = {
			globalstatus = true,
			theme = bubbles_theme,
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
			lualine_b = { "branch" },
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1,
				},
			},

			lualine_x = {
				lint_progress,
				-- active_formatters,
				"encoding",
				"fileformat",
				"filetype",
			},
			lualine_y = {
				{
					function()
						return require("dap").status()
					end,
					icon = { "" },
					separator = { left = "", right = "" },
					left_padding = 2,
					right_padding = 2,
					cond = function()
						if not package.loaded.dap then
							return false
						end
						local session = require("dap").session()
						return session ~= nil
					end,
				},
			},
			lualine_z = {
				{ "progress", separator = { left = "" }, left_padding = 2 },
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
	})
end

return M
