local ok, edgy = pcall(require, "edgy")
if not ok then
  return
end

edgy.setup({
  animate = {
    enabled = true,
    fps = 100, -- frames per second
    cps = 120, -- cells per second
    on_begin = function()
      vim.g.minianimate_disable = true
    end,
    on_end = function()
      vim.g.minianimate_disable = false
    end,
    -- Spinner for pinned views that are loading.
    -- if you have noice.nvim installed, you can use any spinner from it, like:
    -- spinner = require("noice.util.spinners").spinners.circleFull,
    spinner = {
      frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      interval = 80,
    },
  },
  keys = {
    -- close sidebar
    ["<Leader-e>"] = function(win)
      win.view.edgebar:close()
    end,
  },
  right = {
    {
      title = "Neo-Tree",
      ft = "neo-tree",
      filter = function(buf)
        return vim.b[buf].neo_tree_source == "filesystem"
      end,
      size = { height = 0.5 },
    },
    {
      ft = "Outline",
      pinned = true,
      open = "SymbolsOutline",
    }
  },
})
