if exists('g:loaded_space_vlaze')
	finish
endif
let g:loaded_space_vlaze = 1


command! SpaceVlaze call space_vlaze#Start()


nnoremap <leader>sv :SpaceVlaze<cr>
