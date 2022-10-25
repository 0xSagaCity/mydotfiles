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
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-space'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = {
    { name = 'luasnip' }, --snippets
    { name = 'nvim_lsp' }, --language server
    { name = 'path' }, --file paths
    { name = 'buffer' }, --current buffer words
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      maxwidth = 60,
      ellipsis_char = "...",
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

cmp.setup(cmp_config)

vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
