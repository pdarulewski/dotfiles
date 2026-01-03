local Rose = {
	highlight_groups = {},
}

Rose.highlight_groups = {
	NonText = { fg = "#484557" },
	Folded = { bg = "#1c1a2b" },

	TelescopeBorder = { fg = "highlight_high", bg = "none" },
	TelescopeNormal = { bg = "none" },
	TelescopePromptNormal = { bg = "base" },
	TelescopeResultsNormal = { fg = "subtle", bg = "none" },
	TelescopeSelection = { fg = "text", bg = "base" },
	TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

	["@string"] = { fg = "iris" },

	-- go
	["@comment.go"] = { fg = "subtle", italic = true },
	["@comment.documentation.go"] = { fg = "subtle", italic = true },

	-- yaml
	["@string.yaml"] = { fg = "love" },
}

return Rose
