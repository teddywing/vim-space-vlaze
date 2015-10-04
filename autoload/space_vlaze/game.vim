function! space_vlaze#game#Init()
	let s:loop = 1
	let s:score = 0
	let s:start_time = localtime()
	call space_vlaze#game#SetupWindow()
	call space_vlaze#colors#Initialize()
	call space_vlaze#game#InitializeBoard()
	call space_vlaze#mappings#Initialize()
	
	while s:loop ==# 1
		sleep 50ms
		call space_vlaze#mappings#Listen()
		call space_vlaze#game#RenderBoard()
		redraw!
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
endfunction


function! space_vlaze#game#Board()
	return s:board
endfunction


function! space_vlaze#game#SetBoardCell(y, x, value)
	let s:board[a:y][a:x] = a:value
endfunction


function! space_vlaze#game#Quit()
	let s:loop = -1
endfunction


function! space_vlaze#game#Pause()
endfunction
