local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

vim.cmd("highlight! FloatBorder guibg=NONE guifg=#393230")

local border_opts = {
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

--lazy load friendly snippets for completion
require("luasnip/loaders/from_vscode").lazy_load()
lspkind.init()
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp_config = {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-space"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	},
	duplicates = {
		nvim_lsp = 1,
		luasnip = 1,
		cmp_tabnine = 1,
		buffer = 1,
		path = 1,
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},
	window = {
		completion = cmp.config.window.bordered(border_opts),
		documentation = cmp.config.window.bordered(border_opts),
	},
	sources = {
		{ name = "luasnip" }, --snippets
		{ name = "nvim_lsp" }, --language server
		{ name = "path" }, --file paths
		{ name = "buffer" }, --current buffer words
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		mode = "symbold_text",
		format = lspkind.cmp_format({
			with_text = false,
			maxwidth = 60,
			ellipsis_char = "...",
			menu = {
				buffer = "[BUF]",
				nvim_lsp = "[LSP]",
				path = "[PATH]",
				luasnip = "[SNIP]",
				nvim_lua = "[API]",
			},
		}),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
}

cmp.setup(cmp_config)

vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])
