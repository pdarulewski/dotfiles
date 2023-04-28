vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = "nvim-lua/plenary.nvim",
	})

	use({ "ahmedkhalf/project.nvim" }) -- Telescope projects
	use({ "akinsho/toggleterm.nvim", tag = "*" })
	use({ "kdheepak/lazygit.nvim" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use({ "nvim-treesitter/nvim-treesitter" }, { run = ":TSUpdate" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- formatters

	use({ "akinsho/bufferline.nvim", tag = "*", requires = { "nvim-tree/nvim-web-devicons" } })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "nvim-tree/nvim-tree.lua" })
	use({ "mbbill/undotree" })

	use({ "theprimeagen/harpoon" })

	use({ "numToStr/Comment.nvim" })

	use({ "folke/tokyonight.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "RRethy/vim-illuminate" })
	use({ "windwp/nvim-autopairs" })
end)
