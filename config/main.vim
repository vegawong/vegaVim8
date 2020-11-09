
let s:VEGA_CONFIG_GENERAL_FILE = g:VEGA_VIM_PWD."/config/general.vim"
let s:VEGA_CONFIG_PLUGINS_FILE = g:VEGA_VIM_PWD."/config/plugins.vim"
let s:VEGA_CONFIG_PLUGINS_SETTING_PATH = g:VEGA_VIM_PWD."/config/plugins"
let s:VEGA_PLUGINS_INSTALL_PATH = g:VEGA_VIM_PWD."/plug"
let s:VEGA_CONFIG_COLOR_FILE = g:VEGA_VIM_PWD."/config/color.vim"
let s:VEGA_CONFIG_KEYMAPS_FILE = g:VEGA_VIM_PWD."/config/keymaps.vim"


" ================================================================
" 通用设置
" ================================================================
execute 'source '.fnameescape(s:VEGA_CONFIG_GENERAL_FILE)



" ================================================================
" 加载插件
" ================================================================
execute 'source '.fnameescape(s:VEGA_CONFIG_PLUGINS_FILE)



" ================================================================
" 插件设置
" ================================================================
for file in split(glob(s:VEGA_CONFIG_PLUGINS_SETTING_PATH."/*.vim"), '\n')
  " 如果有安装插件，则加载与插件同名的配置文件"
  let s:plugInstalled = s:VEGA_PLUGINS_INSTALL_PATH."/".fnamemodify(file, ":t:r")
  if !empty(glob(s:plugInstalled))
    execute 'source '.file
  " else 
  "   echo s:plugInstalled
  endif
endfor



" ================================================================
" 主题设置
" ================================================================
execute 'source '.fnameescape(s:VEGA_CONFIG_COLOR_FILE)



" ================================================================
" 快捷键设置
" ================================================================
execute 'source '.fnameescape(s:VEGA_CONFIG_KEYMAPS_FILE)

let g:gruvbox_hls_cursor=1
