set nocompatible " 关闭vi兼容模式

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

