-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false,
		max_file_lines = nil,
	},
	-- enable indentation
	indent = { enable = false },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	incremental_selection = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"rasi",
		"kotlin",
		"regex",
		"scss",
		"todotxt",
		"go",
		"make",
		"json",
		"rust",
		"javascript",
		"typescript",
		"jsdoc",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"help",
		"vim",
	},
	-- auto install above language parsers
	auto_install = true,
})
