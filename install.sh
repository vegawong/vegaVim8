#!/bin/sh

# 软链vim配置文件
bak_timestamp=`date +%s`
echo $bak_timestamp
rm $HOME/.vim_* $HOME/.vimrc_* # 开发模式调试，移除多余的备份文件， 生产移除
mv $HOME/.vim $HOME/.vim_bak_$bak_timestamp
mv $HOME/.vimrc $HOME/.vimrc_bak_$bak_timestamp
ln -s $PWD $HOME/.vim
ln -s $PWD/vimrc $HOME/.vimrc

# 下载plug插件管理器
# https://github.com/junegunn/vim-plug#vim
# raw.githubusercontent.com加速
# https://juejin.im/post/6876715404455051272#heading-5
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.staticdn.net/junegunn/vim-plug/master/plug.vim