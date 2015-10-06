" Generate a random integer between 0 and `max`
" 
" From:
" http://vi.stackexchange.com/questions/807/how-to-generate-random-numbers/812#812
function! space_vlaze#random#Random(max)
	python << EOS
import random
import vim
r = random.randint(0, vim.eval('a:max'))
vim.command('let r = %d' % r)
EOS
	return r
endfunction
