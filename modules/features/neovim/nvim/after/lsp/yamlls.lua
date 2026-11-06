return {
	settings = {
		yaml = {
			schemas = {
				["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
				["http://json.schemastore.org/github-action"] = "action.{yml,yaml}",
				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
				["http://json.schemastore.org/pre-commit-config"] = "./.pre-commit-config.{yml,yaml}",
				["https://raw.githubusercontent.com/oapi-codegen/oapi-codegen/HEAD/configuration-schema.json"] = ".oapi.{yml,yaml}",
			},
		},
	},
}
