let s:VEGA_VIM_PLUG_FOLDER = g:VEGA_VIM_ROOT . "/plug"

call plug#begin(s:VEGA_VIM_PLUG_FOLDER)

" 颜色主题
Plug 'lifepillar/vim-solarized8' " solarized8 主题(支持真色）
Plug 'joshdick/onedark.vim' " onedark主题
Plug 'gosukiwi/vim-atom-dark'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'

" 界面
Plug 'vim-airline/vim-airline' " 美化状态栏
Plug 'vim-airline/vim-airline-themes' " 状态栏主题设置 
Plug 'mhinz/vim-startify'  " 默认启动页

" coc & tools with coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-actions', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " 颜色高亮
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}

" 语法高亮
Plug 'HerringtonDarkholme/yats.vim' " typescript语法高亮
Plug 'mxw/vim-jsx' " jsx语法高亮
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/jsonc.vim' " jsonc支持，支持comment的json filetype
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}

" lsp
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}

" lints
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
Plug 'bmatcuk/coc-stylelintplus', {'do': 'yarn install --frozen-lockfile'}


" 文件管理
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' | Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" clap : 快速打开文件&搜索
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'vn-ki/coc-clap'

" 其他
Plug 'yianwillis/vimcdoc' " vim中文帮助文档
Plug 'honza/vim-snippets' " 一些预设的代码片段合集
Plug 'tpope/vim-commentary' " 注释
Plug 'suy/vim-context-commentstring' " 同文件内区分不同代码类型段的注释上下文设置
Plug 'tpope/vim-fugitive' | Plug 'APZelos/blamer.nvim' " git集成



call plug#end()
