function! space_vlaze#life#Initialize()
	let s:lives = 3
endfunction


function! space_vlaze#life#IncrementLives()
	let s:lives += 1
endfunction


function! space_vlaze#life#DecrementLives()
	let s:lives -= 1
endfunction


function! space_vlaze#life#RenderLives()
	let lives_line = space_vlaze#game#BoardHeight() + 1
	let lives_display = ''
	
	let i = 0
	while i < s:lives
		let lives_display .= space_vlaze#player#PlayerCharacter() . ' '
		
		let i += 1
	endwhile
	
	call setline(lives_line, lives_display)
endfunction
