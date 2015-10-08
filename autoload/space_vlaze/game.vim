function! space_vlaze#game#Init()
	let s:loop = 1
	let s:start_time = localtime()
	let s:ticks = 1
	call space_vlaze#game#SetupWindow()
	call space_vlaze#colors#Initialize()
	call space_vlaze#game#InitializeBoard()
	call space_vlaze#mappings#Initialize()
	call space_vlaze#score#Initialize()
	call space_vlaze#life#Initialize()
	
	while s:loop ==# 1
		sleep 50ms
		call space_vlaze#mappings#Listen()
		call space_vlaze#enemy#AddEnemiesToBoard()
		call space_vlaze#game#RenderBoard()
		call space_vlaze#score#RenderScore()
		call space_vlaze#life#RenderLives()
		let s:ticks += 1
	endwhile
endfunction


function! space_vlaze#game#SetupWindow()
	setlocal bufhidden=delete noswapfile nolazyredraw
endfunction


function! space_vlaze#game#InitializeBoard()
	call space_vlaze#game#SetupBoard()
	call space_vlaze#game#RenderBoard()
endfunction


function! space_vlaze#game#SetupBoard()
	let s:board = []
	let s:BOARD_HEIGHT = 20
	let s:BOARD_WIDTH = 80
	call space_vlaze#player#SetPlayerX(s:BOARD_WIDTH / 2 - 1)
	call space_vlaze#player#SetPlayerY(s:BOARD_HEIGHT / 2)
	
	" Create 20-row by 80-column board initialised with spaces
	let i = 0
	while i < s:BOARD_HEIGHT
		let s:board = add(s:board, [])
		
		let j = 0
		while j < s:BOARD_WIDTH
			let s:board[i] = add(s:board[i], ' ')
			
			let j += 1
		endwhile
		
		let i += 1
	endwhile
	
	" Initialise player to the middle of the board
	let s:board[space_vlaze#player#PlayerY()][space_vlaze#player#PlayerX()] = space_vlaze#player#PlayerCharacter()
endfunction


function! space_vlaze#game#RenderBoard()
	let i = 1
	while i <= s:BOARD_HEIGHT
		call setline(i, join(s:board[i - 1], ''))
		
		let i += 1
	endwhile
	
	redraw!
endfunction


function! space_vlaze#game#Board()
	return s:board
endfunction


function! space_vlaze#game#BoardCell(y, x)
	return s:board[a:y][a:x]
endfunction


function! space_vlaze#game#SetBoardCell(y, x, value)
	if space_vlaze#game#IsWithinBoard(a:y, a:x)
		let s:board[a:y][a:x] = a:value
	endif
endfunction


function! space_vlaze#game#ClearBoardCell(y, x)
	call space_vlaze#game#SetBoardCell(a:y, a:x, ' ')
endfunction


function! space_vlaze#game#IsBoardCellEmpty(y, x)
	if space_vlaze#game#IsWithinBoard(a:y, a:x)
		return s:board[a:y][a:x] ==# ' '
	endif
endfunction


function! space_vlaze#game#IsWithinBoard(y, x)
	return a:y >=# 0 && a:y <# s:BOARD_HEIGHT && a:x >=# 0 && a:x <# s:BOARD_WIDTH
endfunction


function! space_vlaze#game#BoardHeight()
	return s:BOARD_HEIGHT
endfunction


function! space_vlaze#game#BoardWidth()
	return s:BOARD_WIDTH
endfunction


function! space_vlaze#game#Ticks()
	return s:ticks
endfunction


function! space_vlaze#game#Quit()
	let s:loop = -1
endfunction


function! space_vlaze#game#Pause()
endfunction


function! space_vlaze#game#GameOver()
	call space_vlaze#game#Quit()
	
	let text = [
		\ ['G', ' ', 'A', ' ', 'M', ' ', 'E'],
		\ ['O', ' ', 'V', ' ', 'E', ' ', 'R'],
	\ ]
	
	" Put "Game Over" text in the middle of the board
	let text_y = s:BOARD_HEIGHT / 2
	let text_x = s:BOARD_WIDTH / 2 - 2
	let text_x_orig = text_x
	
	for line in text
		for character in line
			call space_vlaze#game#SetBoardCell(text_y, text_x, character)
			
			let text_x += 1
		endfor
		
		let text_y += 1
		let text_x = text_x_orig
	endfor
endfunction
