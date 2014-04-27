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
  install_rbenv_plugin "tpope"        "rbenv-communal-gems"
  install_rbenv_plugin "sstephenson"  "rbenv-default-gems"
  install_rbenv_plugin "sstephenson"  "rbenv-gem-rehash"

  echo 'bundler'      > $RBENV_ROOT/default_gems
  echo 'hash_syntax' >> $RBENV_ROOT/default_gems
  echo 'gem-browse'  >> $RBENV_ROOT/default_gems
  echo 'pygments.rb' >> $RBENV_ROOT/default_gems
  echo 'redcarpet'   >> $RBENV_ROOT/default_gems

  rbenv install 2.1.1
  rbenv global 2.1.1
}
