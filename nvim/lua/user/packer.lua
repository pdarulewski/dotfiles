vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = "nvim-lua/plenary.nvim",
  })

  use({ "ahmedkhalf/project.nvim" })
  use({ "akinsho/toggleterm.nvim", tag = "*" })
  use({ "kdheepak/lazygit.nvim" })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      { "nvim-tree/nvim-web-devicons" }
    }
  })
  use({ "mbbill/undotree" })
  use({ "theprimeagen/harpoon" })
  use({ "folke/which-key.nvim" })
  use({ "goolord/alpha-nvim" })

  use({ "nvim-treesitter/nvim-treesitter" }, { run = ":TSUpdate" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "ray-x/lsp_signature.nvim" })
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

  use({ "mfussenegger/nvim-dap" })
  use({ "rcarriga/nvim-dap-ui" })

  use({ "leoluz/nvim-dap-go" })
  use({ "mfussenegger/nvim-dap-python" })

  use({ "nvim-lualine/lualine.nvim" })

  use({ "RRethy/vim-illuminate" })
  use({ "windwp/nvim-autopairs" })
  use({ "numToStr/Comment.nvim" })
  use({ "folke/todo-comments.nvim" })
  use({ "github/copilot.vim" })
  use({ "hrsh7th/cmp-path" })
  use({ "lewis6991/gitsigns.nvim" })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "folke/neodev.nvim" })
  use({ "karb94/neoscroll.nvim" })
  use({ "SmiteshP/nvim-navic" })
  use({ "phaazon/hop.nvim" })

  use({ "folke/tokyonight.nvim" })
  use({ "EdenEast/nightfox.nvim" })
end)
