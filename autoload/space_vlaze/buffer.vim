function! space_vlaze#buffer#Init()
	let s:buffer_name = 'Space Vlaze'
	
	if !buflisted(s:buffer_name)
		call space_vlaze#buffer#New()
	else
		execute 'b' . bufnr(s:buffer_name)
	endif
	
	call space_vlaze#menus#Start()
endfunction


function space_vlaze#buffer#New()
	execute 'edit ' . escape(s:buffer_name, ' ')
endfunction
