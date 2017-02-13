function! s:SurroundWith(before, after) abort
    execute 'normal! `>a' . a:after . "\<esc>`<i" . a:before . "\<esc>``"
    " If we want to restore visual selection it could be done like this
    " execute 'normal! `<' . len(a:before) . 'lv`>' . len(a:before) . 'l'
endfunction

vnoremap <Plug>(yawiki-mark-bold)
    \ :<C-u>call <SID>SurroundWith('**', '**')<CR>
vnoremap <Plug>(yawiki-mark-italic)
    \ :<C-u>call <SID>SurroundWith('//', '//')<CR>
vnoremap <Plug>(yawiki-mark-strikeout)
    \ :<C-u>call <SID>SurroundWith('--', '--')<CR>
vnoremap <Plug>(yawiki-mark-code)
    \ :<C-u>call <SID>SurroundWith('%%', '%%')<CR>
vnoremap <Plug>(yawiki-mark-underline)
    \ :<C-u>call <SID>SurroundWith('__', '__')<CR>
vnoremap <Plug>(yawiki-mark-note)
    \ :<C-u>call <SID>SurroundWith('!!', '!!')<CR>
vnoremap <Plug>(yawiki-mark-question)
    \ :<C-u>call <SID>SurroundWith('??', '??')<CR>

if !get(g:, 'yawiki_disable_formatting', 0)
    vmap <unique> <buffer> <Leader>mb <Plug>(yawiki-mark-bold)
    vmap <unique> <buffer> <Leader>mi <Plug>(yawiki-mark-italic)
    vmap <unique> <buffer> <Leader>mc <Plug>(yawiki-mark-code)
    vmap <unique> <buffer> <Leader>ms <Plug>(yawiki-mark-strikeout)
    vmap <unique> <buffer> <Leader>mu <Plug>(yawiki-mark-underline)
    vmap <unique> <buffer> <Leader>mn <Plug>(yawiki-mark-note)
    vmap <unique> <buffer> <Leader>mq <Plug>(yawiki-mark-question)
endif
