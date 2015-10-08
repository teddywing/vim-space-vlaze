if !exists('s:AUDIO_PATH')
	let s:AUDIO_PATH = resolve(expand('<sfile>:p:h')) . '/../../Resources'
endif


function! space_vlaze#audio#Play(filename)
	if executable('mplayer')
		call system('mplayer ' . s:AUDIO_PATH . '/' . a:filename . ' &')
	endif
endfunction


function! space_vlaze#audio#PlayEnemyDefeated()
	call space_vlaze#audio#Play('enemy-defeated.wav')
endfunction


function! space_vlaze#audio#PlayPlayerMove()
	call space_vlaze#audio#Play('player-move.wav')
endfunction


function! space_vlaze#audio#PlayFireMissiles()
	call space_vlaze#audio#Play('fire.wav')
endfunction
