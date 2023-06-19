local M = {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
}

M.config = function()
  local ok, dapui = pcall(require, "dapui")
  if not ok then
    return
  end

  dapui.setup()

  local ok, dap = pcall(require, "dap")
  if not ok then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
end

return M
