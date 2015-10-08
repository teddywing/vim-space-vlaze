function! space_vlaze#mappings#Initialize()
	nnoremap <silent><buffer> q       <nop>
	nnoremap <silent><buffer> p       <nop>
	nnoremap <silent><buffer> h       <nop>
	nnoremap <silent><buffer> j       <nop>
	nnoremap <silent><buffer> k       <nop>
	nnoremap <silent><buffer> l       <nop>
	nnoremap <silent><buffer> <space> <nop>
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
