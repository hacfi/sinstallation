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

function install_nodenv_plugin {
  mkdir -p $NODENV_ROOT/plugins 2> /dev/null

  local user="$1"; shift 1;
  local plugin_name="$1"; shift 1;
  local plugin_repo="https://github.com/$user/$plugin_name"
  local plugin_dir="$NODENV_ROOT/plugins/$plugin_name"

  clone_or_pull_repo $plugin_dir $plugin_repo
}

function install_node {
  export NODENV_ROOT=/usr/local/var/nodenv

  clone_or_pull_repo "$NODENV_ROOT" "https://github.com/OiNutter/nodenv.git"

  ln -sf $NODENV_ROOT/bin/nodenv /usr/local/bin/

  install_nodenv_plugin "OiNutter" "node-build"

  if ! [ -d "/usr/local/var/nodenv/versions/0.10.26" ]; then
    nodenv install 0.10.26
    nodenv global 0.10.26
  fi
}
