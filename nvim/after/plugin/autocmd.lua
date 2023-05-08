local neovim_group = vim.api.nvim_create_augroup("neovim", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  desc = "Check if we need to reload the file when it changed",
  command = "checktime",
  group = neovim_group,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Open file at same location where it was opened last time",
  callback = function()
    vim.cmd([[silent! normal! g`"]])
  end,
  group = neovim_group,
})

vim.api.nvim_create_autocmd({ "User" }, {
  desc = "Remove statusline and tabline when in Alpha",
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[ set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3 ]]
  end,
  group = neovim_group,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end,
  group = neovim_group,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "Close some filetypes with <q>",
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "TelescopePrompt",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close!<cr>", { buffer = event.buf, silent = true })
  end,
  group = neovim_group,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = "Resize splits if window got resized",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
  group = neovim_group,
})
