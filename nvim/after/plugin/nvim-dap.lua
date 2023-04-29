require('dap.ext.vscode').load_launchjs(nil, {})

vim.keymap.set("n", "<F2>", function() require('dap').step_into() end)
vim.keymap.set("n", "<F3>", function() require('dap').step_over() end)
vim.keymap.set("n", "<F4>", function() require('dap').step_out() end)
vim.keymap.set("n", "<F5>", function() require('dap').continue() end)
vim.keymap.set("n", "<F6>", function() require('dap').restart() end)
vim.keymap.set("n", "<F7>", function() require('dap').close() end)
