local M = {
  "folke/tokyonight.nvim",
  event = "VimEnter",
}

M.config = function()
  require("tokyonight").setup({
    style = "moon",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true,     -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent",   -- style for floating windows
    },
    dim_inactive = true,
    on_highlights = function(hl, colors)
      hl.LineNr = { fg = colors.cyan }
      hl.CursorLineNr = { fg = colors.yellow, bold = true }
    end,
  })

  vim.cmd.colorscheme "tokyonight"
end

return M
