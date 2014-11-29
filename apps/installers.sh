function download_app {
  local url="$1"; shift 1;
  local local_file="$1"; shift 1;

  if ! [ -a "$local_file" ]; then
    wget -O "$local_file" "$url"
  fi
}

function install_pagekite {
  local pagekite_local_binary='/usr/local/bin/pagekite.py'

  if ! [ -a "$pagekite_local_binary" ]; then
    download_app 'https://pagekite.net/pk/pagekite.py' $pagekite_local_binary
    chmod 755 "$pagekite_local_binary"
    mkdir /usr/local/var/run
    sudo touch /var/log/pagekite.log
    sudo chown `whoami`:staff /var/log/pagekite.log

    "$pagekite_local_binary" --signup
  fi
}

function install_mac_app_store_app {
  local app_name="$1"; shift 1;

  if ! [ -a "/Applications/$app_name" ]; then
    echo "$app_name is in the Mac App Store"
    echo "Press Return to continue..."
    read
  fi
}

function install_or_upgrade_app {
  local app_name="$1"; shift 1;

  if $(brew cask list | grep $app_name); then
    brew upgrade $app_name
  else
    brew install $app_name
  fi
}
