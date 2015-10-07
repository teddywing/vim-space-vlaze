function! space_vlaze#score#Initialize()
	let s:score = 0
endfunction


" Increment score by `num`
function! space_vlaze#score#IncrementScore(num)
	let s:score += a:num
endfunction


function! space_vlaze#score#RenderScore()
	let score_line = space_vlaze#game#BoardHeight() + 1
	
	call setline(score_line, 'Score: ' . s:score)
endfunction
