function! space_vlaze#player#PlayerCharacter()
	return '◆'
endfunction


function! space_vlaze#player#ClearPlayerCell()
	call space_vlaze#game#SetBoardCell(space_vlaze#game#PlayerY(), space_vlaze#game#PlayerX(), ' ')
endfunction


function! space_vlaze#player#MoveLeft()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#game#SetBoardCell(space_vlaze#game#PlayerY(), space_vlaze#game#PlayerX() - 1, space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#MoveDown()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#game#SetBoardCell(space_vlaze#game#PlayerY() + 1, space_vlaze#game#PlayerX(), space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#MoveUp()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#game#SetBoardCell(space_vlaze#game#PlayerY() - 1, space_vlaze#game#PlayerX(), space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#MoveRight()
	call space_vlaze#player#ClearPlayerCell()
	call space_vlaze#game#SetBoardCell(space_vlaze#game#PlayerY(), space_vlaze#game#PlayerX() + 1, space_vlaze#player#PlayerCharacter())
endfunction


function! space_vlaze#player#FireBlasters()
endfunction
