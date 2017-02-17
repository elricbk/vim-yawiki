function! s:SurroundWith(before, after) abort
    execute 'normal! `>a' . a:after . "\<esc>`<i" . a:before . "\<esc>``"
    " If we want to restore visual selection it could be done like this
    " execute 'normal! `<' . len(a:before) . 'lv`>' . len(a:before) . 'l'
endfunction

vnoremap <Plug>(yawiki-mark-bold)
    \ :<C-u>call <SID>SurroundWith('**', '**')<CR>
vnoremap <Plug>(yawiki-mark-italic)
    \ :<C-u>call <SID>SurroundWith('//', '//')<CR>
vnoremap <Plug>(yawiki-mark-monospaced)
    \ :<C-u>call <SID>SurroundWith('##', '##')<CR>
vnoremap <Plug>(yawiki-mark-strikeout)
    \ :<C-u>call <SID>SurroundWith('--', '--')<CR>
vnoremap <Plug>(yawiki-mark-code)
    \ :<C-u>call <SID>SurroundWith('%%', '%%')<CR>
vnoremap <Plug>(yawiki-mark-underline)
    \ :<C-u>call <SID>SurroundWith('__', '__')<CR>
vnoremap <Plug>(yawiki-mark-note)
    \ :<C-u>call <SID>SurroundWith('!!', '!!')<CR>
vnoremap <Plug>(yawiki-mark-quote)
    \ :<C-u>call <SID>SurroundWith('<[', ']>')<CR>
vnoremap <Plug>(yawiki-mark-escaped)
    \ :<C-u>call <SID>SurroundWith('""', '""')<CR>
vnoremap <Plug>(yawiki-mark-link)
    \ :<C-u>call <SID>SurroundWith('((', '))')<CR>

if get(g:, 'yawiki_disable_formatting', 0)
    finish
endif

vmap <buffer> <Leader>mb <Plug>(yawiki-mark-bold)
vmap <buffer> <Leader>mc <Plug>(yawiki-mark-code)
vmap <buffer> <Leader>me <Plug>(yawiki-mark-escaped)
vmap <buffer> <Leader>mi <Plug>(yawiki-mark-italic)
vmap <buffer> <Leader>ml <Plug>(yawiki-mark-link)
vmap <buffer> <Leader>mm <Plug>(yawiki-mark-monospaced)
vmap <buffer> <Leader>mn <Plug>(yawiki-mark-note)
vmap <buffer> <Leader>mq <Plug>(yawiki-mark-quote)
vmap <buffer> <Leader>ms <Plug>(yawiki-mark-strikeout)
vmap <buffer> <Leader>mu <Plug>(yawiki-mark-underline)

if !exists('g:yawiki_cyrillic_prefix')
    finish
endif

let p = g:yawiki_cyrillic_prefix
execute "vmap <buffer> " . p . "ьи <Plug>(yawiki-mark-bold)"
execute "vmap <buffer> " . p . "ьс <Plug>(yawiki-mark-code)"
execute "vmap <buffer> " . p . "ьу <Plug>(yawiki-mark-escaped)"
execute "vmap <buffer> " . p . "ьш <Plug>(yawiki-mark-italic)"
execute "vmap <buffer> " . p . "ьд <Plug>(yawiki-mark-link)"
execute "vmap <buffer> " . p . "ьь <Plug>(yawiki-mark-monospaced)"
execute "vmap <buffer> " . p . "ьт <Plug>(yawiki-mark-note)"
execute "vmap <buffer> " . p . "ьй <Plug>(yawiki-mark-quote)"
execute "vmap <buffer> " . p . "ьы <Plug>(yawiki-mark-strikeout)"
execute "vmap <buffer> " . p . "ьг <Plug>(yawiki-mark-underline)"
