let mapleader = ","

nnoremap <silent> <leader>s :set hlsearch!<CR>
nnoremap <silent> <leader>n :set relativenumber!<CR>

"ChadTree
nnoremap <leader>\ :CHADopen<CR>

" split window
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" buffer navigation
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <leader>, :bp<CR>

" copy to system clip
vnoremap <silent> <leader>y "+y<CR>
vnoremap <silent> <leader>p "+p<CR>

map Y y$

map <Space> :

" show list
nnoremap <silent> <Esc> :set list!<CR>

"config reload
nmap <leader>r :so /home/sagacity/.config/nvim/init.vim<CR>

" normal escape in terminal
tnoremap <Esc> <C-\><C-n>

" Trouble Keymaps
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>


omap ae :<C-U>silent! normal! ggVG<CR>
vnoremap ae :<C-U>silent! normal! ggVG<CR>
