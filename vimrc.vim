set nocompatible " 关闭vi兼容模式

" ================================================================
" 变量设置
" ================================================================
let g:VEGA_VIM_ROOT = "~/.vim" " VIM配置文件路径
let s:VEGA_VIM_PLUG_FILE = g:VEGA_VIM_ROOT . "/bundles.vim" " VIM插件配置文件
let s:VEGA_VIM_KEYMAPS_FILE = g:VEGA_VIM_ROOT . "/keymaps.vim" " VIM快捷键映射文件


" ================================================================
" 加载插件
" ================================================================
if filereadable(expand(s:VEGA_VIM_PLUG_FILE.""))
    execute 'source '.fnameescape(s:VEGA_VIM_PLUG_FILE)
endif


" ================================================================
" vim 自身设置
" ================================================================
set background=dark " 指定vim用深色背景
filetype plugin indent on " 检测文件类型后并自动应用对应插件和缩进规则
syntax on " 开启语法高亮
set hidden " 当前缓冲区有改动且未保存时切换, vim会隐藏缓冲器而不是放弃改动，切换回来时状态还在
set noswapfile " 载入缓冲区是不生成交换文件
set nobackup " 覆盖文件时不生成备份文件
set mousemodel=popup " 鼠标工作模式： 右键-菜单，shift+左键扩展选择区域(iterm2貌似不生效)
set mouse=a " 允许所有模式下使用鼠标
set tabstop=2 " （渲染）<TAB>制表符占用4个空格符长度
set shiftwidth=2 " 每层缩进2个空格
set softtabstop=2 " 开启expandtab时候<TAB>和<BS>对应操作的空格数=2
set smarttab " 行首输入<TAB>时候输入'shiftwidth'个空格
set expandtab " 输入<TAB>是替换成空格
set shiftround " 使用缩进命令时<TAB>总是操作'softtab'的倍数
set autoindent " 添加新行时采用与当前行同等的自动缩进
set smartindent " 基于autoindent的改进
set nu " 显示行号
set rnu " 显示相对行号
set cursorcolumn " 高亮当前列
set cursorline " 高亮当前行
set encoding=utf-8 " 默认字符编码为utf-8
set fileencodings=utf-8,ucs-bom,cp3936,gb18030,big5,euc-jp,euc-kr,latin1 " 按顺序检测符合的文件字符编码并对应改变encoding的值
" set termencoding=utf-8 " 终端使用的字符编码
" set guifont=Source\ Code\ Pro\ for\ Powerline:h12 " GUI版本使用的字体
set hlsearch " 高亮搜索
set incsearch " 在输入要搜索的文字时， 实时匹配
set ignorecase " 搜索模式里忽略大小写
set smartcase " 如果搜索模式包含大写字符，不使用'ignorecase'选项
set updatetime=300 " 缩短光标停留事件触发时间
set signcolumn=yes " 总是显示标记列，防止输入时列时显时隐导致窗口抖动
set backspace=indent,eol,start
set termguicolors
colorscheme one " 设置主题色

" 这里会导致vim8颜色显示异常，变成颜色代码字符
if has("termguicolors")
    " " fix bug for vim
    " set t_8f=^[[38;2;%lu;%lu;%lum
    " set t_8b=^[[48;2;%lu;%lu;%lum

    " 给终端开启truecolor
    set termguicolors
endif


" ================================================================
" 插件设置
" ================================================================
" vim-airline/vim-airline
" let g:airline#extensions#tabline#enabled = 1 " 开启tab栏加强
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示buffer索引
let g:airline#extensions#tabline#formatter = 'unique_tail' " 更改tabName显示格式，同名时显示唯一区分
let g:airline_powerline_fonts = 1 " 启用powerline字体支持
let g:airline_theme='one' " 使用onedark主题
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}' " airline集成coc的错误数目显示
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}' " airline集成coc的警告数目显示

" mxw/vim-jsx
let g:jsx_ext_required = 0   " Allow JSX in normal JS files

" suy/vim-context-commentstring
function! s:UpdateCommentString()
  if exists('g:context#commentstring#table')
    let g:context#commentstring#table['javascriptreact'] = g:context#commentstring#table['javascript.jsx']
    let g:context#commentstring#table['typescriptreact'] = g:context#commentstring#table['typescript.tsx']
  endif
endfunction
autocmd FileType * call <SID>UpdateCommentString()

" jsonc
au BufNewFile,BufRead tsconfig.json set filetype=jsonc

" NERDTree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMinimalUI = 1
" NERDTree窗口关闭标记列和关闭高亮列
autocmd FileType NERDTree set signcolumn=no | set nocuc

" vim-clap
let g:clap_search_box_border_style = ''

" blamer
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '

" mhinz/vim-startify
let g:startify_custom_header = [
            \' $$$$$$$$\                        $$\     $$\                                   $$$$$$$\                        $$\     ',
            \' \__$$  __|                       \$$\   $$  |                                  $$  __$$\                       $$ |    ',
            \'    $$ | $$$$$$\  $$\   $$\        \$$\ $$  /$$$$$$\  $$\   $$\  $$$$$$\        $$ |  $$ | $$$$$$\   $$$$$$$\ $$$$$$\   ',
            \'    $$ |$$  __$$\ $$ |  $$ |        \$$$$  /$$  __$$\ $$ |  $$ |$$  __$$\       $$$$$$$\ |$$  __$$\ $$  _____|\_$$  _|  ',
            \'    $$ |$$ |  \__|$$ |  $$ |         \$$  / $$ /  $$ |$$ |  $$ |$$ |  \__|      $$  __$$\ $$$$$$$$ |\$$$$$$\    $$ |    ',
            \'    $$ |$$ |      $$ |  $$ |          $$ |  $$ |  $$ |$$ |  $$ |$$ |            $$ |  $$ |$$   ____| \____$$\   $$ |$$\ ',
            \'    $$ |$$ |      \$$$$$$$ |          $$ |  \$$$$$$  |\$$$$$$  |$$ |            $$$$$$$  |\$$$$$$$\ $$$$$$$  |  \$$$$  |',
            \'    \__|\__|       \____$$ |          \__|   \______/  \______/ \__|            \_______/  \_______|\_______/    \____/ ',
            \'                  $$\   $$ |                                                                                            ',
            \'                  \$$$$$$  |                                                                                            ',
            \'                   \______/                                                                                             '
            \]




" ================================================================
" 快捷键设置
" ================================================================
if filereadable(expand(s:VEGA_VIM_KEYMAPS_FILE.""))
    execute 'source '.fnameescape(s:VEGA_VIM_KEYMAPS_FILE)
endif 

