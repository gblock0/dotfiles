" Text File Settings
autocmd BufReadPre *.txt setlocal spell spelllang=en_us

au BufNewFile,BufRead Dockerfile_base set filetype=dockerfile
au BufRead,BufNewFile *.md setlocal textwidth=80


