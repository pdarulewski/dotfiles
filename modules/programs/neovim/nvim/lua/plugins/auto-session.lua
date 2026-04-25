return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard" },
		-- log_level = 'debug',
	},
}
