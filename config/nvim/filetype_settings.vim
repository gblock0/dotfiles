" JSON File Settings
au BufNewFile,BufRead *.json set ft=javascript

" Markdown File Settings
autocmd BufReadPre *.md setlocal spell spelllang=en_us
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Text File Settings
autocmd BufReadPre *.txt setlocal spell spelllang=en_us

" HTML File Settings
autocmd BufNewFile,BufRead *.ejs set filetype=html

" XML File Settings
autocmd BufNewFile,BufRead *.svg set filetype=xml

" Conf File Settings
au BufNewFile,BufRead *.conf setfiletype apache
