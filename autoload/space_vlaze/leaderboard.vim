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
	
_    ____ ____ ___  ____ ____ ___  ____ ____ ____ ___  
|    |___ |__| |  \ |___ |__/ |__] |  | |__| |__/ |  \ 
|___ |___ |  | |__/ |___ |  \ |__] |__| |  | |  \ |__/ 
                                                       

 __                            __                    
/\ \                          /\ \                   
\ \ \         __      __      \_\ \      __    _ __  
 \ \ \  __  /'__`\  /'__`\    /'_` \   /'__`\ /\`'__\
  \ \ \L\ \/\  __/ /\ \L\.\_ /\ \L\ \ /\  __/ \ \ \/ 
   \ \____/\ \____\\ \__/.\_\\ \___,_\\ \____\ \ \_\ 
    \/___/  \/____/ \/__/\/_/ \/__,_ / \/____/  \/_/ 

      __                                   __     
     /\ \                                 /\ \    
     \ \ \____    ___      __      _ __   \_\ \   
      \ \ '__`\  / __`\  /'__`\   /\`'__\ /'_` \  
       \ \ \L\ \/\ \L\ \/\ \L\.\_ \ \ \/ /\ \L\ \ 
        \ \_,__/\ \____/\ \__/.\_\ \ \_\ \ \___,_\
         \/___/  \/___/  \/__/\/_/  \/_/  \/__,_ /
                                                  
endfunction
