local opt = vim.opt

opt.cursorline = true
opt.incsearch = true
opt.ruler = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 0
opt.expandtab = false

opt.ai = true
opt.si = true
opt.smartcase = true
opt.ignorecase = true
opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.smartindent = true
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
