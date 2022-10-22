lua <<EOF
  local cmp = require'cmp'
  local lspkind = require'lspkind'
	lspkind.init()

	vim.opt.completeopt = { "menu", "menuone", "noselect" }

  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
		  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<c-space'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<c-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = {
			{ name = 'luasnip' },
      { name = 'nvim_lsp' },
			{ name = 'path' },
      { name = 'buffer' },
    },
    formatting = {
      format = lspkind.cmp_format {
				with_text = true, 
				maxwidth = 60,
				menu = {
					buffer = "[BUF]",
					nvim_lsp = "[LSP]",
					path = "[PATH]",
					luasnip = "[SNIP]",
					nvim_lua = "[API]"
				}
			}
    },
		experimental = {
			native_menu = false,
			ghost_text = true,
		}
  }

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
EOF

