if exists('g:loaded_space_vlaze')
	finish
endif
let g:loaded_space_vlaze = 1


command! SpaceVlaze call space_vlaze#Start()


nnoremap <silent> <Plug>SpaceVlaze :<c-u>SpaceVlaze<cr>

if !hasmapto('<Plug>SpaceVlaze') || !maparg('<leader>sv', 'n')
	nmap <leader>sv <Plug>SpaceVlaze
endif
