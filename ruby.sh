source './homebrew.sh'

function clone_or_pull_repo {
  local plugin_dir="$1"; shift 1;
  local plugin_repo="$1"; shift 1;

  if [ -d $plugin_dir/.git ]; then
    current_dir="$PWD"
    cd $plugin_dir
    git pull
    cd "$current_dir"
  else
    git clone $plugin_repo $plugin_dir
  fi
}

function install_rbenv_plugin {
  mkdir -p $RBENV_ROOT/plugins 2> /dev/null

  local user="$1"; shift 1;
  local plugin_name="$1"; shift 1;
  local plugin_repo="https://github.com/$user/$plugin_name"
  local plugin_dir="$RBENV_ROOT/plugins/$plugin_name"

  clone_or_pull_repo $plugin_dir $plugin_repo
}

function install_ruby {
  export RBENV_ROOT=/usr/local/var/rbenv

  clone_or_pull_repo "$RBENV_ROOT" "https://github.com/sstephenson/rbenv.git"

  ln -sf $RBENV_ROOT/bin/rbenv /usr/local/bin/

  install_rbenv_plugin "sstephenson"  "ruby-build"
  install_rbenv_plugin "tpope"        "rbenv-sentience"
  install_rbenv_plugin "tpope"        "rbenv-readline"
  install_rbenv_plugin "tpope"        "rbenv-aliases"
  install_rbenv_plugin "sstephenson"  "rbenv-gem-rehash"

  if ! [ -d "/usr/local/var/rbenv/versions/2.1.2" ]; then
    $RBENV_ROOT/bin/rbenv install 2.1.2
    $RBENV_ROOT/bin/rbenv global 2.1.2
  fi

  $RBENV_ROOT/shims/gem install bundler
  $RBENV_ROOT/shims/gem install hash_syntax
  $RBENV_ROOT/shims/gem install gem-browse
  $RBENV_ROOT/shims/gem install pygments.rb
  $RBENV_ROOT/shims/gem install pygmentize
  $RBENV_ROOT/shims/gem install redcarpet

  $RBENV_ROOT/bin/rbenv alias --auto
}
