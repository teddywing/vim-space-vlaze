function! space_vlaze#menus#Start()
	echo 'Welcome to Space Vlaze'
	let choice = space_vlaze#menus#Prompt(
		\ 'What would you like to do? (start game (s), view leaderboard (l), view help (h): ')
	
	if choice ==? 's'
		call space_vlaze#game#Init()
	elseif choice ==? 'l'
		call space_vlaze#leaderboard#RenderLeaderboard()
	elseif choice ==? 'h'
		call space_vlaze#help#Show()
	endif
endfunction


function! space_vlaze#menus#Prompt(message)
	call inputsave()
	let input = input(a:message)
	call inputrestore()
	return input
endfunction
