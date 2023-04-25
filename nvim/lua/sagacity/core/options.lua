local opt = vim.opt

opt.cursorline = true
opt.cursorlineopt = "number"
opt.incsearch = true
opt.ruler = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

opt.ai = true
opt.si = true
opt.smartcase = true
opt.ignorecase = true
opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.autoread = true
opt.hidden = true
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.shortmess:append("IFT")
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.inccommand = "split"
opt.laststatus = 2
-- Window Splits
opt.splitright = true
opt.splitbelow = true
-- Speed Update for bulb
opt.updatetime = 200
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.backspace = "indent,eol,start"
opt.wildignore = { "*.o", "*.a", "__pycache__", "node_modules" }
opt.path = { "**" }
opt.formatoptions = "r"

-- Indent blankline
opt.list = true
opt.listchars:append("eol:↴")

-- vim.cmd("highlight! WinSeparator guibg=NONE guifg=#393230")
-- vim.cmd("highlight! NvimTreeWinSeparator guibg=NONE guifg=#393230")
-- vim.cmd("highlight! GitSignsAdd guibg=NONE guifg=#90A959")
-- vim.cmd("highlight! GitSignsChange guibg=NONE guifg=#D28445")
-- vim.cmd("highlight! GitSignsDelete guibg=NONE guifg=#Ac4142")
-- vim.cmd("highlight! CursorLineNr guibg=NONE guifg=#Ac4142")
-- vim.api.nvim_set_hl(0, "Keyword", { bold = true })
