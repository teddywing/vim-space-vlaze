function! space_vlaze#mappings#Initialize()
	nnoremap <silent><buffer> q       :call space_vlaze#game#Quit()<cr>
	nnoremap <silent><buffer> p       :call space_vlaze#game#Pause()<cr>
	nnoremap <silent><buffer> h       :call space_vlaze#player#MoveLeft()<cr>
	nnoremap <silent><buffer> j       :call space_vlaze#player#MoveDown()<cr>
	nnoremap <silent><buffer> k       :call space_vlaze#player#MoveUp()<cr>
	nnoremap <silent><buffer> l       :call space_vlaze#player#MoveRight()<cr>
	nnoremap <silent><buffer> <space> :call space_vlaze#player#FireBlasters()<cr>
endfunction


function! space_vlaze#mappings#Listen()
	let c = nr2char(getchar(0))
	
	if c ==# 'q'
		call space_vlaze#game#GameOver()
	elseif c ==# 'p'
		call space_vlaze#game#Pause()
	elseif c ==# 'h'
		call space_vlaze#player#MoveLeft()
	elseif c ==# 'j'
		call space_vlaze#player#MoveDown()
	elseif c ==# 'k'
		call space_vlaze#player#MoveUp()
	elseif c ==# 'l'
		call space_vlaze#player#MoveRight()
	elseif c ==# ' '
		call space_vlaze#player#FireBlasters()
	endif
endfunction
