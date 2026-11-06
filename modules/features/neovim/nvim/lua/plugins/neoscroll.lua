-- scroll without losing cursor position

local M = {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, neoscroll = pcall(require, "neoscroll")
  if not ok then
    return
  end

  local keymap = {
    -- Use the "sine" easing function
    ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 400; easing = 'sine' }) end;
    ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 400; easing = 'sine' }) end;
    ["zz"] = function() neoscroll.zz({ half_win_duration = 400; easing = 'sine' }) end;
  }
  local modes = { 'n', 'v', 'x' }
  for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
  end
end

return M
