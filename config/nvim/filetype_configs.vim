" Text File Settings
autocmd BufReadPre *.txt setlocal spell spelllang=en_us

au BufNewFile,BufRead Dockerfile_base set filetype=dockerfile
au BufNewFile,BufRead .env.* set filetype=sh

