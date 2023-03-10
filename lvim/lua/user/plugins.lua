local M = {}

M.config = function()

  lvim.plugins = {
    { "kdheepak/lazygit.nvim" },
    { "folke/trouble.nvim", cmd = "TroubleToggle" },

    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
    { "leoluz/nvim-dap-go" },
    { "mfussenegger/nvim-dap-python" },

    { "ray-x/lsp_signature.nvim" }, -- intellisense
    { "simrat39/symbols-outline.nvim" }, -- tree with objects, classes, methods, etc.

    { "karb94/neoscroll.nvim" },
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          keywords = {
            NOTE = { alt = { "SECTION", "REVIEW" } }
          }
        }
      end
    },
    { "arcticicestudio/nord-vim" },
    {
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
        require("rose-pine").setup({ dark_variant = "moon" })
        -- vim.cmd('colorscheme rose-pine')
      end
    },
    { "Pocco81/auto-save.nvim" },
  }

end

return M
