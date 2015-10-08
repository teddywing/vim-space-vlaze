function! space_vlaze#score#Initialize()
	let s:score = 0
endfunction


function! space_vlaze#score#Score()
	return s:score
endfunction


" Increment score by `num`
function! space_vlaze#score#IncrementScore(num)
	let s:score += a:num
endfunction


function! space_vlaze#score#RenderScore()
	let score_line = space_vlaze#game#BoardHeight() + 2
	let score_text = 'Score: ' . s:score
	let score_padding = space_vlaze#padding#RightPadding(score_text)
	
	call setline(score_line, score_text . score_padding)
endfunction
