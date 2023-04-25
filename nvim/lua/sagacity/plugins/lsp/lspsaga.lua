-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	ui = {
		-- currently only round theme
		theme = "round",
		-- this option only work in neovim 0.9
		title = false,
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		winblend = 0,
		expand = "  ",
		collapse = "  ",
		preview = " ",
		code_action = "🖉",
		diagnostic = "🐛",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			normal_bg = "#282828",
			--title background color
			title_bg = "#b8bb26",
			red = "#cc241d",
			magenta = "#b16286",
			orange = "#fabd2f",
			yellow = "#fabd2f",
			green = "#b8bb26",
			cyan = "#458588",
			blue = "#076678",
			purple = "#8f3f71",
			white = "#ebdbb2",
			black = "#1d2021",
		},
		kind = {},
		symbol_in_winbar = {
			enable = false,
			separator = "  ",
			ignore_patterns = {},
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
			respect_root = true,
			color_mode = false,
		},
		outline = {
			win_position = "left",
			win_with = "",
			win_width = 30,
			show_detail = true,
			auto_preview = true,
			auto_refresh = true,
			auto_close = true,
			custom_sort = nil,
			keys = {
				jump = "o",
				expand_collapse = "u",
				quit = "q",
			},
		},
	},
})
