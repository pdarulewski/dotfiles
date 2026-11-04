local Rose = {
	highlight_groups = {},
}

Rose.highlight_groups = {
	NonText = { fg = "#8b7299" },
	Folded = { bg = "#1c1a2b" },

	TelescopeBorder = { fg = "highlight_high", bg = "none" },
	TelescopeNormal = { bg = "none" },
	TelescopePromptNormal = { bg = "base" },
	TelescopeResultsNormal = { fg = "subtle", bg = "none" },
	TelescopeSelection = { fg = "text", bg = "base" },
	TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

	["@string"] = { fg = "iris" },

	-- go
	["@comment.go"] = { fg = "#b393c4", italic = true },
	["@comment.documentation.go"] = { fg = "#b393c4", italic = true },

	-- yaml
	["@property.yaml"] = { fg = "pine" },
	["@string.yaml"] = { fg = "foam" },
}

return Rose
