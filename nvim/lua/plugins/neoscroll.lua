local M = {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, neoscroll = pcall(require, "neoscroll")
  if not ok then
    return
  end

  local easing = "sine"
  local zz_time_ms = 100
  local jump_time_ms = 350

  -- https://github.com/karb94/neoscroll.nvim/issues/65
  neoscroll.setup({
    post_hook = function(info)
      if info ~= "center" then
        return
      end

      -- The `defer_fn` is a bit of a hack.
      -- We use it so that `neoscroll.init.scroll` will be false when we call `neoscroll.zz`
      -- As long as we don't input another neoscroll mapping in the timeout,
      -- we should be able to center the cursor.
      local defer_time_ms = 10
      vim.defer_fn(function()
        neoscroll.zz(zz_time_ms, easing)
      end, defer_time_ms)
    end,
  })

  local mappings = {}

  mappings["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", jump_time_ms, easing, "'center'" } }
  mappings["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", jump_time_ms, easing, "'center'" } }

  local ok, config = pcall(require, "neoscroll.config")
  if not ok then
    return
  end

  config.set_mappings(mappings)
end

return M
