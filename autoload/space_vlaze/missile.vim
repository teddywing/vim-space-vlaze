" Fires all (4) missiles around an origin corrdinate (should be the player)
function! space_vlaze#missile#FireAll(y, x)
	let left = 1
	let bottom = 1
	let top = 1
	let right = 1
	
	call space_vlaze#audio#PlayFireMissiles()
	
	let i = 1
	while left || bottom || top || right
		if left
			let left = space_vlaze#missile#Move(a:y, a:x - i, 'left')
		endif
		
		if bottom
			let bottom = space_vlaze#missile#Move(a:y + i, a:x, 'bottom')
		endif
		
		if top
			let top = space_vlaze#missile#Move(a:y - i, a:x, 'top')
		endif
		
		if right
			let right = space_vlaze#missile#Move(a:y, a:x + i, 'right')
		endif
		
		sleep 20ms
		
		let i += 1
	endwhile
endfunction


" Move a missile starting from a set of coordinates in a specified direction.
" Clears the missile's previous location.
" 
" y: Previous Y coordinate of missile
" x: Previous X coordinate of missile
" direction: 'left', 'right', 'bottom', or 'top'
" returns: 1 if the missile was able to move, 0 if it hit a wall or object
function! space_vlaze#missile#Move(y, x, direction)
	let y = a:y
	let x = a:x
	
	if a:direction ==# 'left'
		let x -= 1
	elseif a:direction ==# 'right'
		let x += 1
	elseif a:direction ==# 'bottom'
		let y += 1
	elseif a:direction ==# 'top'
		let y -= 1
	endif
	
	call space_vlaze#missile#ClearMissile(a:y, a:x)
	
	if space_vlaze#game#IsBoardCellEmpty(y, x)
		call space_vlaze#game#SetBoardCell(
			\ y,
			\ x,
			\ space_vlaze#missile#MissileCharacter(a:direction))
		
		call space_vlaze#game#RenderBoard()
		
		return 1
	else
		call space_vlaze#enemy#HandleEnemyHitAt(y, x)
	endif
	
	return 0
endfunction


function! space_vlaze#missile#ClearMissile(y, x)
	call space_vlaze#game#SetBoardCell(a:y, a:x, ' ')
endfunction


function! space_vlaze#missile#MissileCharacter(direction)
	let horizontal = '—'
	let vertical = '|'
	
	if a:direction ==# 'left'
		return horizontal
	elseif a:direction ==# 'right'
		return horizontal
	elseif a:direction ==# 'bottom'
		return vertical
	elseif a:direction ==# 'top'
		return vertical
	endif
endfunction
