require("neo-tree").setup({
  default_component_configs = {
    icon = {
      folder_empty = "󰜌",
      folder_empty_open = "󰜌",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        modified  = "",
        deleted   = "✖",
        renamed   = "➜",
        -- Status type
        untracked = "?",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    position = "right",
    width = 30,
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
  },
  event_handlers = {
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end
    },
    {
      event = "neo_tree_window_after_close",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end
    },
  },
})
