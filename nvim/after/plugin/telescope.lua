local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup {
  pickers = {
    live_grep = {
      additional_args = function(opts)
        return { "--hidden" }
      end
    },
  },
}
