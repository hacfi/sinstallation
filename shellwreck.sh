source './homebrew.sh'

function install_shellwreck {
  install_or_upgrade_package git

  current_dir="$PWD"

  if ! [ -d $HOME/.ssh ]; then
    mkdir "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    chown `whoami`:staff "$HOME/.ssh"
  fi

  if ! [ -d $HOME/.ssh ]; then
    mkdir "$HOME/.gnupg"
    chmod 700 "$HOME/.gnupg"
    chown `whoami`:staff "$HOME/.gnupg"
  fi

  if [ -d $HOME/.shell/.git ]; then
    cd $HOME/.shell && git pull
  else
    git clone https://github.com/jfelchner/shellwreck.git $HOME/.shell
    cd $HOME/.shell
    git submodule update --init
  fi

  $HOME/.shell/bin/install

  cd "$current_dir"
}
