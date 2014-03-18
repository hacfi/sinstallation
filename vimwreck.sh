source './homebrew.sh'

function install_vimwreck {
  install_or_upgrade_package git
  install_or_upgrade_package ctags

  current_dir="$PWD"

  if [ -d $HOME/.vim/.git ]; then
    cd $HOME/.vim && git pull
  else
    git clone https://github.com/jfelchner/vim.git $HOME/.vim
  fi

  rm $HOME/.vimrc 2> /dev/null
  rm $HOME/.gvimrc 2> /dev/null

  ln -s $HOME/.vim/vimrc $HOME/.vimrc
  ln -s $HOME/.vim/gvimrc $HOME/.gvimrc

  mkdir -p $HOME/.vim/bundle/vundle 2> /dev/null

  if [ -d $HOME/.vim/bundle/vundle/.git ]; then
    cd $HOME/.vim/bundle/vundle && git pull
  else
    git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
  fi

  switch_shell="$SHELL"
  export SHELL=/bin/sh
  eval vim +BundleInstall +BundleClean +qall
  export SHELL="$switch_shell"

  cp $HOME/.vim/fonts/* $HOME/Library/Fonts/

  cd "$current_dir"
}
