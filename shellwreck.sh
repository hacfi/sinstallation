source './homebrew.sh'

function install_shellwreck {
  install_or_upgrade_package git

  current_dir="$PWD"

  if [ -d $HOME/.shell/.git ]; then
    cd $HOME/.shell && git pull
  else
    git clone https://github.com/jfelchner/shellwreck.git $HOME/.shell
  fi

  $HOME/.shell/bin/install

  cd "$current_dir"
}
