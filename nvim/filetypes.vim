" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.ts setf typescript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Javascript
au BufNewFile,BufRead *.jsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

filetype plugin on
filetype indent on
