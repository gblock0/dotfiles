nnoremap ? :BLine<CR>
" Intentional space left after `:Rg` to allow for faster searching
nnoremap <leader>a :Rg<Space>
nnoremap <C-p> :GFiles<Cr>

if (has("nvim"))
	let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
else
	let g:fzf_layout = { 'down': '~20%' }
endif

