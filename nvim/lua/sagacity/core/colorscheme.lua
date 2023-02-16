-- catppuccin colorscheme
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = true,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		functions = { "bold" },
		strings = { "bold" },
		numbers = { "bold" },
		booleans = { "bold" },
		types = { "bold" },
		operators = { "bold" },
	},
	color_overrides = {
		mocha = {
			base = "#14141E",
		},
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		mason = true,
		telescope = true,
		treesitter = true,
		lsp_saga = true,
		harpoon = true,
		treesitter_context = true,
		which_key = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- gruvbox colorscheme
vim.g.background_color = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_visual = "red background"
vim.g.gruvbox_material_menu_selection_background = "orange"
vim.g.gruvbox_material_diagnostic_text_highlight = 1
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.g.gruvbox_material_current_word = "bold"
vim.g.gruvbox_material_transparent_background = 2

--everforest
vim.g.everforest_background = "hard"
vim.g.everforest_enable_italic = 1
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_current_word = "bold"
vim.g.everforest_transparent_background = 1
-- vim.g.everforest_colors_override = { 'bg0' = ['#202020', '234'] }

--sonokai
vim.g.sonokai_style = "espresso"
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_transparent_background = 2
vim.g.sonokai_diagnostic_text_highlight = 1
vim.g.sonokai_diagnostic_line_highlight = 1
vim.g.sonokai_current_word = "bold"
vim.g.sonokai_better_performance = 1
vim.g.sonokai_menu_selection_background = "blue"

local status, _ = pcall(vim.cmd, "colorscheme gruvbox-material")
if not status then
	print("colorscheme not found")
	return
end
