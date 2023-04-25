require("staline").setup({
	sections = {
		left = {
			"-mode",
			"right_sep",
			"",
			"-file_name",
			"-branch",
			"right_sep",
		},
		mid = { "lsp" },
		right = {
			"left_sep",
			"-cool_symbol",
			"-lsp_name",
			"- ",
			"right_sep",
			"",
			"-line_column",
		},
	},

	mode_colors = {
		i = "#076678",
		n = "#b8bb26",
		c = "#b16286",
		v = "#fe8019",
	},

	mode_icons = {
		n = " Normal ",
		i = " Insert ",
		c = " Command ",
		v = "  Visual ", -- etc..
		V = "  Visual Line ", -- etc..
	},

	defaults = {
		cool_symbol = "  | ",
		right_separator = "",
		left_separator = "",
		true_colors = true,
		line_column = "[%l:%c]  %p%% ",
		-- font_active = "bold"
		branch_symbol = " ",
	},
})
