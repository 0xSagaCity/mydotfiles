require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_end_of_line = true,
	space_char_blankline = " ",
	show_trailing_blankline_indent = false,
	use_treesitter = true,
	char = "▏",
	context_char = "▏",
	show_current_context = true,
})
