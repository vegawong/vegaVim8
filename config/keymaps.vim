
"========== 
" 快捷键
"========== 

let g:mapleader = ',' " leader键映射


" 编辑模式下光标左右移动
inoremap <c-f> <right>
inoremap <c-b> <left>

" 复制当前内容到系统粘贴板
noremap YY "+y<CR>
" 将系统粘贴板内容粘贴到当前位置
noremap <leader>p "+gP<CR>
" 剪切当前内容到系统粘贴板 
noremap XX "+x<CR>
" dd删除不占用目前寄存器, 可以粘贴上一次复制到寄存器里的内容
noremap dd "_dd<CR>
" ci替换不占用目前寄存器, 可以粘贴上一次复制到寄存器里的内容
noremap ci "_ci


" 跳转到上一个警告（依赖插件coc.nvim)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
" 跳转到下一个警告（依赖插件coc.nvim)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" 跳转到定义（依赖插件coc.nvim)
nmap <silent> gd <Plug>(coc-definition)
" 跳转到类型定义（依赖插件coc.nvim)
nmap <silent> gy <Plug>(coc-type-definition)
" 跳转到实现的地方（依赖插件coc.nvim)
nmap <silent> gi <Plug>(coc-implementation)
" 跳转到引用的地方（依赖插件coc.nvim)
nmap <silent> gr <Plug>(coc-references)
" 变量重命名（依赖插件coc.nvim)
nmap <leader>rn <Plug>(coc-rename)
" 显示文档（依赖插件coc.nvim)
function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
" <Tab>键设置（依赖插件coc.nvim)
" 选中当前补全/展开代码片段/代码片段中跳跃/默认<TAB>制表符输入/呼出自动补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort " 检查当前光标是不是在空格或者行首
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" 回车键确认当前候选的选择（依赖插件coc.nvim)
" 配合coc-setting里面的suggest.noselect:false，
" 自动选择第一个候选,回车键就默认选中第一个输入
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 快速打开文件
noremap <leader>f :<C-u>Clap files<CR>
" 全局搜索 
noremap <leader>fg :<C-u>Clap grep<CR>
noremap <leader>b :<C-u>Clap buffers<CR>
"

" 格式化代码(依赖插件coc-prettier)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader><c-f> <Plug>(coc-format-selected)
noremap <leader><C-f> :CocCommand prettier.formatFile<CR>


" " defx 文件管理
" nnoremap <silent> <leader>fl
" \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent> <leader>fll
" \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

" NERDTree文件管理
nnoremap <silent> <leader>fl
\ :NERDTreeToggle<CR>


