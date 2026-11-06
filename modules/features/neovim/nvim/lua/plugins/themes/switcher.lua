local Switcher = {
	name = "",
	theme = {},
}

function Switcher.switchTheme()
	local theme = os.getenv("THEME")

	if theme == "ocean" then
		return {
			name = "ocean",
			theme = require("plugins.themes.ocean"),
		}
	elseif theme == "rose" then
		return {
			name = "rose",
			theme = require("plugins.themes.rose"),
		}
	else
		return {
			name = "rose",
			theme = require("plugins.themes.rose"),
		}
	end
end

return Switcher
