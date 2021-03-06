" init.vim
" Author: @theteachr

" Plugins

call plug#begin()
" quality of life
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc-prettier'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" language specific
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" colorschemes
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
call plug#end()

" Treesitter Settings {{{
lua require 'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" ignore TS Errors
highlight link TSError Normal

" }}}

" Options {{{

set showcmd
set cursorline cursorlineopt=number
set incsearch
set ruler
set tabstop=4
set shiftwidth=4
set smartcase
set smarttab
set ignorecase
set noexpandtab
set nohlsearch
set smartindent
set autoread
set hidden
set nowrap
set relativenumber
set nu
set shortmess+=IFT
set termguicolors
set inccommand=split
set laststatus=0
set splitright
set splitbelow
set noswapfile
set nobackup
set nowritebackup
set listchars=tab:\|\ ,trail:•,extends:⟩,precedes:⟨
set list

" }}}

" Filetype Settings {{{

filetype plugin on
filetype indent on

" }}}

" Keymaps {{{
"Leader
let mapleader = ","

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" copy to system clip
vnoremap <silent> <leader>y "*y<CR>
map K k
map Y y$
map <Space> :

" telecope bindings
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" show list
nnoremap <silent> <Esc> :set list!<CR>

" normal escape in terminal
tnoremap <Esc> <C-\><C-n>

" reload config globally
nnoremap <leader>r <cmd>so ~/.config/nvim/init.vim<cr>

" }}}

" Custom Text Objects {{{

omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>

"COC Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" }}}

" Colorscheme Settings {{{
" gruvbox
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_cursor = 'green'
let g:gruvbox_material_ui_contrast = 'low'
let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_statusline_style = 'original'
let g:gruvbox_material_palette = 'orignal'
" sonokai [default|atlantis|andromeda|shusia|maia|espresso]
let g:sonokai_style = 'espresso'

colorscheme gruvbox-material

" }}}



" Transparency {{{

"highlight Normal ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none

" }}}

" Auto Commands {{{

augroup CSNIPPET
	autocmd!
	autocmd BufNewFile *.c :0r ~/.config/nvim/snippets/c/boiler.c
augroup END

augroup Terminal
	autocmd!
	autocmd BufWinEnter,WinEnter term://* startinsert
augroup END

" }}}

" vim:fileencoding=utf-8:foldmethod=marker
