function! space_vlaze#colors#Initialize()
	syntax match Enemy  '♤'
	syntax match Player '◆'
	syntax match Lives  /^|.*/
	syntax match Score  /^Score: .\+/
	
	highlight Enemy  ctermfg=136 ctermbg=NONE
	highlight Player ctermfg=200 ctermbg=NONE
	highlight Lives  ctermfg=255 ctermbg=89
	highlight Score  ctermfg=255 ctermbg=92
	highlight Normal ctermfg=255 ctermbg=235
endfunction
