local M = {}

M.config = function()

  require('dapui').setup()

  require('dap-python').setup('~/Library/Caches/pypoetry/virtualenvs/lvim-_NmbRTpQ-py3.11/bin/python')

  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  require('dap.ext.vscode').load_launchjs(nil, {})
  require('dap-python').test_runner = 'pytest'

  local configurations = require('dap').configurations.python

  for _, configuration in pairs(configurations) do
    configuration.justMyCode = false
  end

end

return M
