local Ocean = {
	on_highlights = function() end,
	on_colors = function() end,
}

-- catppuccin macchiato colors
local text = "#cad3f5"
local overlay_1 = "#8087a2"
local sapphire = "#7dc4e4"
local peach = "#f5a97f"
local blue = "#8aadf4"
local mauve = "#c6a0f6"
local green = "#a6da95"
local pink = "#f5bde6"
local magenta = "#ff476f"
local orange = "#ff692d"
local teal = "#8bd5ca"
local lavender = "#b7bdf8"

local blue1 = "#7dc4e4"
local blue2 = "#7BBAF9"

local blue = "#82aaff"
local blue0 = "#3e68d7"
local blue1 = "#65bcff"
local blue2 = "#0db9d7"
local blue3 = "#54c9dd"
local blue5 = "#89ddff"
local blue6 = "#b4f9f8"
local blue7 = "#394b70"
local blue8 = "#4f84bc"
local border = "#1b1d2b"
local border_highlight = "#589ed7"
local comment = "#636da6"
local cyan = "#86e1fc"
local cyan1 = "#cef3ff"
local dark3 = "#545c7e"
local dark5 = "#737aa2"
local pink1 = "#eda8da"
local green1 = "#96eab0"
local green2 = "#4fbc9b"

function Ocean.on_highlights(highlights, colors)
	highlights.LineNr = { fg = sapphire }
	highlights.CursorLineNr = { fg = peach, bold = true }
	highlights.Normal = { fg = lavender }
	highlights["DiagnosticUnderlineWarn"] = { fg = dark5, underline = true }

	-- python
	highlights["@variable.python"] = { fg = lavender }
	highlights["@variable.member.python"] = { fg = blue1 }
	highlights["@variable.builtin.python"] = { fg = dark5, italic = true }
	highlights["@variable.parameter.python"] = { fg = dark5 }

	highlights["@type.python"] = { fg = blue2, bold = true }
	highlights["@type.builtin.python"] = { fg = blue8 }

	highlights["@constant.python"] = { fg = green1 }
	highlights["@constant.builtin.python"] = { fg = blue8 }
	highlights["@boolean.python"] = { fg = green2 }
	highlights["@number.python"] = { fg = peach }
	highlights["@number.float.python"] = { fg = peach }

	highlights["@string.python"] = { fg = text }
	highlights["@string.documentation.python"] = { fg = overlay_1 }

	highlights["@keyword.python"] = { fg = pink1 }
	highlights["@keyword.function.python"] = { fg = pink1 }
	highlights["@keyword.conditional.python"] = { fg = pink1 }
	highlights["@keyword.exception.python"] = { fg = pink1 }
	highlights["@keyword.coroutine.python"] = { fg = pink1 }
	highlights["@keyword.return.python"] = { fg = pink1 }
	highlights["@keyword.repeat.python"] = { fg = pink1 }

	highlights["@function.python"] = { fg = blue2 }
	highlights["@function.call.python"] = { fg = blue2 }
	highlights["@function.method.python"] = { fg = blue2 }
	highlights["@function.method.call.python"] = { fg = blue2 }
	highlights["@constructor.python"] = { fg = blue2, bold = true }

	-- go
	highlights["@type.go"] = { fg = blue8 }
	highlights["@type.builtin.go"] = { fg = blue8 }
	highlights["@type.definition.go"] = { fg = blue2, bold = true }

	highlights["@module.go"] = { fg = blue2, bold = true }
	highlights["@string.go"] = { fg = text }
	highlights["@constant.go"] = { fg = green1 }
	highlights["@constant.builtin.go"] = { fg = blue8 }
	highlights["@comment.go"] = { fg = overlay_1, italic = true }

	highlights["@keyword.go"] = { fg = pink1 }
	highlights["@keyword.function.go"] = { fg = pink1 }
	highlights["@keyword.conditional.go"] = { fg = pink1 }

	highlights["@function.go"] = { fg = blue2 }
	highlights["@function.call.go"] = { fg = blue2 }
	highlights["@function.method.go"] = { fg = blue2 }
	highlights["@function.method.call.go"] = { fg = blue2 }

	highlights["@variable.go"] = { fg = lavender }
	highlights["@variable.member.go"] = { fg = blue1 }
	highlights["@variable.parameter.go"] = { fg = dark5 }

	highlights["@property.go"] = { fg = blue1 }

	highlights["@number.go"] = { fg = peach }
	highlights["@number.float.go"] = { fg = peach }

	highlights["@boolean.go"] = { fg = green2 }

	-- gomod
	highlights["@keyword.gomod"] = { fg = pink1 }
	highlights["@string.gomod"] = { fg = text }

	-- dockerfile
	highlights["@keyword.dockerfile"] = { fg = pink1, italic = true, bold = true }
	highlights["@property.dockerfile"] = { fg = pink1 }
	highlights["@string.dockerfile"] = { fg = text }
	highlights["@constant.dockerfile"] = { fg = pink1 }

	-- yaml
	highlights["@property.yaml"] = { fg = blue1 }
	highlights["@string.yaml"] = { fg = text }
	highlights["@number.yaml"] = { fg = peach }
	highlights["@boolean.yaml"] = { fg = green2 }

	-- json
	highlights["@property.json"] = { fg = blue1 }
	highlights["@string.json"] = { fg = text }
	highlights["@number.json"] = { fg = peach }
	highlights["@boolean.json"] = { fg = green2 }

	highlights["jsonKeyword"] = { fg = blue1 }
	highlights["jsonString"] = { fg = text }

	-- bash
	highlights["@function.call.bash"] = { fg = blue2 }
	highlights["@variable.parameter.bash"] = { fg = lavender }
	highlights["@constant.bash"] = { fg = pink1 }
	highlights["@string.bash"] = { fg = text }

	-- zsh
	highlights["zshKeyword"] = { fg = blue2 }
	highlights["zshString"] = { fg = text }
	highlights["zshBracket"] = { fg = blue1 }

	-- git_config
	highlights["@property.git_config"] = { fg = blue1 }
	highlights["@string.git_config"] = { fg = text }

	-- lua
	highlights["@lsp.type.parameter.lua"] = { fg = lavender }
	highlights["@string.lua"] = { fg = text }

	-- toml
	highlights["@property.toml"] = { fg = blue1 }
	highlights["@string.toml"] = { fg = lavender }
end

function Ocean.on_colors(colors)
	colors.hint = colors.orange
	colors.comment = overlay_1
	colors.error = magenta
	-- colors.orange = orange
end

return Ocean
