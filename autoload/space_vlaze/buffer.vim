function! space_vlaze#buffer#Init()
	let s:buffer_name = 'Space Vlaze'
	
	if !buflisted(s:buffer_name)
		" call space_vlaze#game#Init()
		call space_vlaze#buffer#New()
		call space_vlaze#menus#Start()
	else
		" enew
		" execute 'b' 
	endif
endfunction


function space_vlaze#buffer#New()
	execute 'edit ' . escape(s:buffer_name, ' ')
endfunction
