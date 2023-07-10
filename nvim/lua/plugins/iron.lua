local M = {
  "Vigemus/iron.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, iron = pcall(require, "iron.core")
  if not ok then
    return
  end

  iron.setup({
    config = {
      scratch_repl = true,
      repl_definition = {
        sh = {
          command = { "zsh" }
        },
        python = {
          command = function(meta)
            return { 'python', '-m', 'bpython' }
          end
        }
      },
      repl_open_cmd = require("iron.view").right("20%"),
      ignore_blank_lines = true,
    },
  })
end

return M
