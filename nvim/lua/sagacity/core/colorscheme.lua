-- catppuccin colorscheme
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = false,
	term_colors = false,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		functions = { "bold" },
		keywords = { "bold" },
		strings = { "italic" },
		variables = { "bold" },
		numbers = { "bold" },
		booleans = { "bold" },
		properties = { "italic" },
		types = { "italic" },
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
vim.g.string_style = "italic"
vim.g.variable_style = "bold"
vim.g.gruvbox_baby_function_style = "bold"
vim.g.gruvbox_baby_keyword_style = "italic"
-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1
-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1
vim.g.use_original_palette = true

--GruvQueen
-- setup must be called before loading the colorscheme
-- Default options:
require("gruvqueen").setup({
	config = {
		disable_bold = false,
		italic_comments = true,
		italic_keywords = true,
		italic_functions = true,
		italic_variables = true,
		invert_selection = true,
		style = "orignal", -- possible values: 'original', 'mix', 'material'
		transparent_background = true,
		bg_color = "black",
	},
})

--gruvbox-baby
vim.g.gruvbox_baby_function_style = "bold"
vim.g.gruvbox_baby_keyword_style = "bold"
vim.g.gruvbox_baby_variable_style = "italic"
vim.g.gruvbox_baby_string_style = "italic"
vim.g.gruvbox_baby_comment_style = "italic"
vim.g.gruvbox_baby_background_color = "dark"

vim.g.gruvbox_baby_telescope_theme = 0
vim.g.gruvbox_baby_transparent_mode = 1

-- onedarkpro theme
require("onedarkpro").setup({
	caching = true, -- Use caching for the theme?
	cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
	colors = { onedark_dark = { bg = "#101215" } }, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
	highlights = {}, -- Override default highlight and/or filetype groups
	filetypes = { -- Override which filetype highlight groups are loaded
		javascript = true,
		lua = true,
		markdown = true,
		php = true,
		python = true,
		ruby = true,
		rust = true,
		toml = true,
		yaml = true,
	},
	plugins = { -- Override which plugin highlight groups are loaded
		-- See the Supported Plugins section for a list of available plugins
	},
	styles = { -- Choose from "bold,italic,underline"
		types = "bold", -- Style that is applied to types
		numbers = "bold", -- Style that is applied to numbers
		strings = "italic", -- Style that is applied to strings
		comments = "italic", -- Style that is applied to comments
		keywords = "bold", -- Style that is applied to keywords
		constants = "NONE", -- Style that is applied to constants
		functions = "bold", -- Style that is applied to functions
		operators = "bold", -- Style that is applied to operators
		variables = "bold", -- Style that is applied to variables
		conditionals = "bold", -- Style that is applied to conditionals
		virtual_text = "undercurl", -- Style that is applied to virtual text
	},
	options = {
		bold = true, -- Use bold styles?
		italic = true, -- Use italic styles?
		underline = true, -- Use underline styles?
		undercurl = true, -- Use undercurl styles?
		cursorline = true, -- Use cursorline highlighting?
		transparency = true, -- Use a transparent background?
		terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
		window_unfocused_color = false, -- When the window is out of focus, change the normal background?
	},
})

local status, _ = pcall(vim.cmd, "colorscheme gruvbox-baby")
if not status then
	print("colorscheme not found")
	return
end
