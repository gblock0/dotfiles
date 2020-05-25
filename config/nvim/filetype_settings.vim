" JSON File Settings
autocmd FileType json syntax match Comment +\/\/.\+$+

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
au BufNewFile,BufRead *.conf set filetype=apache

au BufNewFile,BufRead Dockerfile_base set filetype=dockerfile


