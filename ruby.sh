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

function install_or_upgrade_gem {
  local gem_name="$1"; shift 1;

  if [ -z "`$RBENV_ROOT/shims/gem list | /usr/bin/grep -e \"^$gem_name\s\"`" ]; then
    gem install --no-ri --no-rdoc $gem_name
  else
    gem update --no-ri --no-rdoc $gem_name
  fi

  gem cleanup $gem_name
}

function install_ruby {
  export RBENV_ROOT=/usr/local/var/rbenv

  clone_or_pull_repo "$RBENV_ROOT" "https://github.com/sstephenson/rbenv.git"

  ln -sf $RBENV_ROOT/bin/rbenv /usr/local/bin/

  install_rbenv_plugin "sstephenson"  "ruby-build"
  install_rbenv_plugin "tpope"        "rbenv-readline"
  install_rbenv_plugin "tpope"        "rbenv-aliases"

  if ! [ -d "/usr/local/var/rbenv/versions/2.1.4" ]; then
    $RBENV_ROOT/bin/rbenv install 2.1.4
    $RBENV_ROOT/bin/rbenv global 2.1.4
  fi

  install_or_upgrade_gem awesome_print
  install_or_upgrade_gem bundler
  install_or_upgrade_gem gem-browse
  install_or_upgrade_gem hash_syntax
  install_or_upgrade_gem heroku
  install_or_upgrade_gem overcommit
  install_or_upgrade_gem pygmentize
  install_or_upgrade_gem pygments.rb
  install_or_upgrade_gem redcarpet
  install_or_upgrade_gem rubocop
  install_or_upgrade_gem rubygems-update
  install_or_upgrade_gem scss-lint
  install_or_upgrade_gem travis
  install_or_upgrade_gem travis-lint

  $RBENV_ROOT/bin/rbenv alias --auto
}
