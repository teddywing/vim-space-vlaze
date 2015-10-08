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
	return a:item1 ==# a:item2 ? 0 :
		\ a:item1 ># a:item2 ? -1 : 1
endfunction


function! space_vlaze#leaderboard#RenderLeaderboard()
endfunction
