function! space_vlaze#mappings#Initialize()
	nnoremap <silent><buffer><nowait> q       :call space_vlaze#game#Quit()
	nnoremap <silent><buffer><nowait> p       :call space_vlaze#game#Pause()
	nnoremap <silent><buffer><nowait> h       :call space_vlaze#player#MoveLeft()
	nnoremap <silent><buffer><nowait> j       :call space_vlaze#player#MoveDown()
	nnoremap <silent><buffer><nowait> k       :call space_vlaze#player#MoveUp()
	nnoremap <silent><buffer><nowait> l       :call space_vlaze#player#MoveRight()
	nnoremap <silent><buffer><nowait> <space> :call space_vlaze#player#FireBlasters()
endfunction
