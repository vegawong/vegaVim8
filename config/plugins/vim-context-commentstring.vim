function! s:UpdateCommentString()
  if exists('g:context#commentstring#table')
    let g:context#commentstring#table['javascriptreact'] = g:context#commentstring#table['javascript.jsx']
    let g:context#commentstring#table['typescriptreact'] = g:context#commentstring#table['typescript.tsx']
  endif
endfunction
autocmd FileType * call <SID>UpdateCommentString()
