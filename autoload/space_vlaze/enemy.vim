function! space_vlaze#enemy#EnemyCharacter()
	return '♤'
endfunction


if !exists('s:MAX_ENEMIES_ON_BOARD')
	let s:MAX_ENEMIES_ON_BOARD = 50
endif

if !exists('s:MIN_ENEMIES_ON_BOARD')
	let s:MIN_ENEMIES_ON_BOARD = 50
endif


if !exists('s:ENEMY_POINT_BASE')
	let s:ENEMY_POINT_BASE = 1
endif


function! space_vlaze#enemy#AddEnemiesToBoard()
	let ticks = space_vlaze#game#Ticks()
	
	" At a 50ms refresh rate 100 ticks == 5 seconds
	if ticks % 100 ==# 1
		let new_enemy_count = ticks / 20
		
		if new_enemy_count <# s:MIN_ENEMIES_ON_BOARD
			let new_enemy_count = s:MIN_ENEMIES_ON_BOARD
		endif
		
		if new_enemy_count ># s:MAX_ENEMIES_ON_BOARD
			let new_enemy_count = s:MAX_ENEMIES_ON_BOARD
		endif
		
		let i = 0
		while i < new_enemy_count
			call space_vlaze#enemy#DropEnemyAtRandomCoordinates()
			
			let i += 1
		endwhile
	endif
endfunction


function! space_vlaze#enemy#DropEnemyAtRandomCoordinates()
	let player_y = space_vlaze#player#PlayerY()
	let player_x = space_vlaze#player#PlayerX()
	let y = player_y
	let x = player_x
	
	" Don't drop enemy at the same coordinates as the player
	while player_y ==# y && player_x ==# x
		let y = space_vlaze#random#Random(space_vlaze#game#BoardHeight() - 1)
		let x = space_vlaze#random#Random(space_vlaze#game#BoardWidth() - 1)
	endwhile
	
	call space_vlaze#game#SetBoardCell(y, x, space_vlaze#enemy#EnemyCharacter())
endfunction


" Calling this function tells us that coordinates y, x were hit by a missile.
" If an enemy lives at y, x, it needs to disappear and update the score.
function! space_vlaze#enemy#HandleEnemyHitAt(y, x)
	if space_vlaze#game#IsWithinBoard(a:y, a:x)
		if space_vlaze#game#BoardCell(a:y, a:x) ==# space_vlaze#enemy#EnemyCharacter()
			call space_vlaze#game#ClearBoardCell(a:y, a:x)
			call space_vlaze#score#IncrementScore(
				\ s:ENEMY_POINT_BASE * space_vlaze#enemy#PointMultiplier())
			
			return 1
		endif
	endif
endfunction


function! space_vlaze#enemy#PointMultiplier()
	return 1
endfunction
