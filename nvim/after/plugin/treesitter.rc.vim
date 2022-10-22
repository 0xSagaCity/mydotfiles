if !exists('g:loaded_nvim_treesitter')
	echom "Not loaded treesitter"
	finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {},
		},
	ensure_installed = {
		"tsx",
		"json",
		"html",
		"css",
		"scss",
		"bash",
    "c",
    "cmake",
    "comment",
    "css",
    "go",
    "graphql",
    "html",
    "javascript",
    "jsonc",
    "lua",
    "markdown",
    "python",
    "regex",
    "rust",
    "toml",
    "typescript",
    "vue",
    "yaml",
    "wgsl",
		},
	highlight = {
		enable = true,
		use_languagetree = true,
		},
	autotag = {
		enable = true,
		}
	}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF
