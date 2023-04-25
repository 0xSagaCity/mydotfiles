-- gruvbox colorscheme
vim.g.background_color = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_visual = "red background"
vim.g.gruvbox_material_menu_selection_background = "orange"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_current_word = "bold"
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_foreground = "mix"
vim.g.gruvbox_material_ui_contrast = "low"
vim.g.gruvbox_material_spell_foreground = "colored"
vim.g.gruvbox_material_show_eob = 0

-- gruvbox-baby
-- Example config in Lua
vim.g.gruvbox_baby_function_style = "bold"
vim.g.gruvbox_baby_keyword_style = "bold"
-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
-- vim.g.gruvbox_baby_highlights = { Normal = { fg = "#123123", bg = "NONE", style = "underline" } }
-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 0
-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1
-- Load the colorscheme
-- vim.g.background_color = "dark"
vim.g.gruvbox_baby_string_style = "italic"
vim.g.gruvbox_baby_variable_style = "bold"
vim.g.use_original_palette = false

require("monokai-pro").setup({
	transparent_background = false,
	terminal_colors = true,
	devicons = true, -- highlight the icons of `nvim-web-devicons`
	italic_comments = true,
	filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
	-- Enable this will disable filter option
	day_night = {
		enable = false, -- turn off by default
		day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
		night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
	},
	inc_search = "background", -- underline | background
	background_clear = {
		-- "float_win",
		"toggleterm",
		-- "telescope",
		--"which-key",
		"renamer",
	}, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree"
	plugins = {
		bufferline = {
			underline_selected = true,
			underline_visible = false,
		},
		indent_blankline = {
			context_highlight = "pro", -- default | pro
			context_start_underline = false,
		},
	},
	--- @param c Colorscheme
	override = function(c) end,
})

local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
	print("colorscheme not found")
	return
end
