set termguicolors
colorscheme one " 设置主题色
au FileType * hi Normal guibg=NONE ctermbg=NONE
" 隐藏空行的~
au FileType * hi EndOfBuffer ctermfg=black ctermbg=black

" 这里会导致vim8颜色显示异常，变成颜色代码字符
if has("termguicolors")
    " " fix bug for vim
    " set t_8f=^[[38;2;%lu;%lu;%lum
    " set t_8b=^[[48;2;%lu;%lu;%lum

    " 给终端开启truecolor
    set termguicolors
endif