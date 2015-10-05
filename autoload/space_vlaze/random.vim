" Generate a random integer between 0 and `max`
" 
" From:
" http://vi.stackexchange.com/questions/807/how-to-generate-random-numbers/812#812
function! space_vlaze#random#Random(max)
	return system('python -c "import random; print(random.randint(0, ' . a:max . '))"')
endfunction
