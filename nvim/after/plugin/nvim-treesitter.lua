local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

treesitter.setup({
  ensure_installed = {
    "bash",
    "lua",
    "query",

    "json",
    "toml",
    "yaml",

    "vim",
    "vimdoc",

    "c",
    "cpp",
    "cuda",

    "python",
    "rust",
    "go",
    "gomod",
    "gosum",
    "sql",

    "latex",

    "markdown",
    "comment",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitignore",

    "dockerfile",
    "make",
    "cmake",
    "dot",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
