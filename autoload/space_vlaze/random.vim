" Generate a random integer between 0 and `max`
" 
" From:
" http://vi.stackexchange.com/questions/807/how-to-generate-random-numbers/812#812
function! space_vlaze#random#Random(max)
	ruby << EOS
# Add 1 because rand() will choose a number < max and we want <= max
r = rand(VIM::evaluate('a:max') + 1)
VIM::command('let r = %d' % r)
EOS
	return r
endfunction
