if !exists('s:LEADERBOARD_PATH')
	let s:LEADERBOARD_PATH = resolve(expand('<sfile>:p:h')) . '/../../leaderboard.tsv'
endif


if !exists('s:PLAYER_NAME_PATH')
	let s:PLAYER_NAME_PATH = resolve(expand('<sfile>:p:h')) . '/../../player_name.txt'
endif


function! space_vlaze#leaderboard#MaybePromptForName()
	if !filereadable(s:PLAYER_NAME_PATH)
		let name = space_vlaze#menus#Prompt('Enter your name: ')
		
		call writefile([name], s:PLAYER_NAME_PATH)
	endif
endfunction


function! space_vlaze#leaderboard#SaveHighScore()
	call space_vlaze#leaderboard#MaybePromptForName()
	
	if filereadable(s:LEADERBOARD_PATH)
		let scores = readfile(s:LEADERBOARD_PATH)
		let scores = add(scores, space_vlaze#score#Score())
		let scores = sort(scores, 'space_vlaze#leaderboard#Sort')
		call writefile(scores, s:LEADERBOARD_PATH)
	else
		call writefile([space_vlaze#score#Score()], s:LEADERBOARD_PATH)
	endif
endfunction


" Sorting function that orders numbers from highest to lowest.
" For use with the |sort()| Vim function
function! space_vlaze#leaderboard#Sort(item1, item2)
	let item1 = str2nr(a:item1)
	let item2 = str2nr(a:item2)
	
	return item1 ==# item2 ? 0 :
		\ item1 ># item2 ? -1 : 1
endfunction


function! space_vlaze#leaderboard#RenderLeaderboard()
	let buffer_name = 'Space Vlaze – Leaderboard'
	
	if !buflisted(buffer_name)
		execute 'edit ' . escape(buffer_name, ' ')
	else
		execute 'b' . bufnr(buffer_name)
	endif
	
	let scores = []
	let player_name = []
	
	if filereadable(s:LEADERBOARD_PATH)
		let scores = readfile(s:LEADERBOARD_PATH)
	endif
	
	if filereadable(s:PLAYER_NAME_PATH)
		let player_name = readfile(s:PLAYER_NAME_PATH)
	endif
	
	call space_vlaze#game#SetupWindow()
	
	call setline( 1, '    __                            __                     ')
	call setline( 2, '   /\ \                          /\ \                    ')
	call setline( 3, '   \ \ \         __      __      \_\ \      __    _ __   ')
	call setline( 4, "    \\ \\ \\  __  /'__`\\  /'__`\\    /'_` \\   /'__`\\ /\\`'__\\ ")
	call setline( 5, '     \ \ \L\ \/\  __/ /\ \L\.\_ /\ \L\ \ /\  __/ \ \ \/  ')
	call setline( 6, '      \ \____/\ \____\\ \__/.\_\\ \___,_\\ \____\ \ \_\  ')
	call setline( 7, '       \/___/  \/____/ \/__/\/_/ \/__,_ / \/____/  \/_/  ')
	call setline( 8, '         __                                   __         ')
	call setline( 9, '        /\ \                                 /\ \        ')
	call setline(10, '        \ \ \____    ___      __      _ __   \_\ \       ')
	call setline(11, "         \\ \\ '__`\\  / __`\\  /'__`\\   /\\`'__\\ /'_` \\      ")
	call setline(12, '          \ \ \L\ \/\ \L\ \/\ \L\.\_ \ \ \/ /\ \L\ \     ')
	call setline(13, '           \ \_,__/\ \____/\ \__/.\_\ \ \_\ \ \___,_\    ')
	call setline(14, '            \/___/  \/___/  \/__/\/_/  \/_/  \/__,_ /    ')
	call setline(15, '                                                         ')
	call setline(16, '')
	
	let i = 17
	for score in scores
		call setline(i, '                    ' . player_name[0] . '   ' . score)
		
		let i += 1
	endfor
endfunction
