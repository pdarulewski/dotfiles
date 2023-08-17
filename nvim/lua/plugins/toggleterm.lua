local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, toggleterm = pcall(require, "toggleterm")
  if not ok then
    return
  end

  toggleterm.setup({
    open_mapping = [[<c-\>]],
    direction = "float",
    insert_mappings = true,
    float_opts = {
      border = "curved",
    },
  })

  function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<C-`>', [[<C-\><C-n>]], opts)
  end

  -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
