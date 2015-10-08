function! space_vlaze#padding#RightPadding(string)
	return repeat(' ', space_vlaze#game#BoardWidth() - strchars(a:string))
endfunction
