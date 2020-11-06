
" let g:airline#extensions#tabline#enabled = 1 " 开启tab栏加强
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示buffer索引
let g:airline#extensions#tabline#formatter = 'unique_tail' " 更改tabName显示格式，同名时显示唯一区分
let g:airline_powerline_fonts = 1 " 启用powerline字体支持
let g:airline_theme='one' " 使用onedark主题
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}' " airline集成coc的错误数目显示
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}' " airline集成coc的警告数目显示
