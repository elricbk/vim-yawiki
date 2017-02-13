function! s:NextSection(backwards, visual) abort
    if a:visual
        normal! gv
    endif
    call search('\v(^\s*\=|%^|%$)', a:backwards ? 'bW' : 'W')
endfunction

noremap <script> <buffer> <silent> ]] :call <SID>NextSection(0, 0)<CR>
noremap <script> <buffer> <silent> [[ :call <SID>NextSection(1, 0)<CR>
vnoremap <script> <buffer> <silent> ]] :<C-u>call <SID>NextSection(0, 1)<CR>
vnoremap <script> <buffer> <silent> [[ :<C-u>call <SID>NextSection(1, 1)<CR>
