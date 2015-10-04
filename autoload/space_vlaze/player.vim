function! space_vlaze#player#PlayerCharacter()
	return '◆'
endfunction


function! space_vlaze#player#PlayerX()
	return s:PLAYER_X
endfunction


function! space_vlaze#player#SetPlayerX(player_x)
	let s:PLAYER_X = a:player_x
endfunction


function! space_vlaze#player#PlayerY()
	return s:PLAYER_Y
endfunction


function! space_vlaze#player#SetPlayerY(player_y)
	let s:PLAYER_Y = a:player_y
endfunction


function! space_vlaze#player#ClearPlayerCell()
	call space_vlaze#game#SetBoardCell(space_vlaze#player#PlayerY(), space_vlaze#player#PlayerX(), ' ')
endfunction


function! space_vlaze#player#MoveLeft()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#player#SetPlayerX(space_vlaze#player#PlayerX() - 1)
	call space_vlaze#game#SetBoardCell(space_vlaze#player#PlayerY(), space_vlaze#player#PlayerX(), space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#MoveDown()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#player#SetPlayerY(space_vlaze#player#PlayerY() + 1)
	call space_vlaze#game#SetBoardCell(space_vlaze#player#PlayerY(), space_vlaze#player#PlayerX(), space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#MoveUp()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#player#SetPlayerY(space_vlaze#player#PlayerY() - 1)
	call space_vlaze#game#SetBoardCell(space_vlaze#player#PlayerY(), space_vlaze#player#PlayerX(), space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#MoveRight()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#player#SetPlayerX(space_vlaze#player#PlayerX() + 1)
	call space_vlaze#game#SetBoardCell(space_vlaze#player#PlayerY(), space_vlaze#player#PlayerX(), space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#FireBlasters()
endfunction
