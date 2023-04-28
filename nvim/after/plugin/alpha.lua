function Alpha()
	require('alpha').setup(require('alpha.themes.dashboard').config)
	local alpha = require'alpha'
	local dashboard = require'alpha.themes.dashboard'
	dashboard.section.buttons.val = {
		 dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
		 dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
	}

	alpha.setup(dashboard.config)
end

Alpha()
