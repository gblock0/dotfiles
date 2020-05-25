" JSON File Settings
autocmd FileType json syntax match Comment +\/\/.\+$+

" Text File Settings
autocmd BufReadPre *.txt setlocal spell spelllang=en_us

au BufNewFile,BufRead Dockerfile_base set filetype=dockerfile


