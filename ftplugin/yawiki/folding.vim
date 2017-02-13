setlocal foldlevel=99
setlocal foldmethod=expr
setlocal foldexpr=GetYawikiFold(v:lnum)

function! GetYawikiFold(lnum) abort
    let line = getline(a:lnum)
    let m = matchlist(line, '^\s*\(=\+\)')
    if len(m)
        return '>' . (len(m[1]) - 1)
    endif
    if line =~? '^<{'
        return 'a1'
    elseif line =~? '^}>'
        return 's1'
    endif
    return '=' 
endfunction
