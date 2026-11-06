return {
	settings = {
		toml = {
			schemas = {
				["http://json.schemastore.org/ruff"] = "./*.{toml}",
				{
					description = "cargo",
					fileMatch = { "Cargo.toml", "Cargo.lock" },
					url = "http://json.schemastore.org/cargo",
				},
			},
		},
	},
}
