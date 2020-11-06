
let g:VEGA_VIM_PWD =fnamemodify(resolve(expand('<sfile>')), ':h')

" let g:VEGA_VIM_ROOT = $HOME . "/.vim" " VIM配置文件路径

execute 'source '.fnameescape(g:VEGA_VIM_PWD."/config/main.vim")
