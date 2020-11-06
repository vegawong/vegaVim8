function! s:setcolum() abort
  " TODO: vimfiler filetypeicon是哪个组件， 兼容？"
  " if g:spacevim_enable_vimfiler_filetypeicon && !g:spacevim_enable_vimfiler_gitstatus
  "   return 'indent:icons:filename:type'
  " elseif !g:spacevim_enable_vimfiler_filetypeicon && g:spacevim_enable_vimfiler_gitstatus
  "   return 'indent:icons:filename:type'
  " elseif g:spacevim_enable_vimfiler_filetypeicon && g:spacevim_enable_vimfiler_gitstatus
  "   return 'indent:git:icons:filename:type'
  " else
  "   return 'mark:indent:icon:filename:type'
  " endif
  return 'mark:indent:icon:filename:type'
endfunction

" 选项设置
call defx#custom#option('_', {
      \ 'columns': s:setcolum(),
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'leftabove',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" 列标记设置
call defx#custom#column('mark', {
      \ 'readonly_icon': '',
      \ 'selected_icon': '',
      \ })

" 列icon设置
call defx#custom#column('icon', {
      \ 'directory_icon': '▶',
      \ 'opened_icon': '▼',
      \ 'root_icon': ' ',
      \ })

" 列文件名设置
call defx#custom#column('filename', {
      \ 'max_width': -90,
      \ })

augroup vfinit
  au!
  autocmd FileType defx call s:defx_init()
  " auto close last defx windows
  autocmd BufEnter * nested if
        \ (!has('vim_starting') && winnr('$') == 1 
        \ && &filetype ==# 'defx') |
        \ call s:close_last_vimfiler_windows() | endif
augroup END


" in this function, we should check if shell terminal still exists,
" then close the terminal job before close vimfiler
function! s:close_last_vimfiler_windows() abort
  exe 'silent bd!'
  q
endfunction

function! s:defx_init()
  setl nonumber
  setl norelativenumber
  setl listchars=
  setl nofoldenable
  setl foldmethod=manual

  nnoremap <silent><buffer><expr> <space>
        \ defx#do_action('toggle_select') . 'j'
  " TODO: we need an action to clear all selections
  nnoremap <silent><buffer><expr> <esc>
        \ defx#do_action('clear_select_all')
  

  " Define mappings
  nnoremap <silent><buffer><expr> gx
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> <Cr>
        \ defx#is_directory() ?
        \ defx#do_action('open_or_close_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> sg
        \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> sv
        \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> st
        \ defx#do_action('drop', 'tabedit')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy defx#do_action('call', 'DefxYarkPath')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-r>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> > defx#do_action('resize',
	  \ defx#get_context().winwidth + 10)
  nnoremap <silent><buffer><expr> < defx#do_action('resize',
	  \ defx#get_context().winwidth - 10)
endfunction


function! DefxYarkPath(_) abort
  let candidate = defx#get_candidate()
  let @+ = candidate['action__path']
  echo 'yanked: ' . @+
endfunction

