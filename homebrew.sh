function install_homebrew {
  if ! [ -x /usr/local/bin/brew ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  /usr/local/bin/brew update
}

function install_or_upgrade_package {
  local package_name=$1; shift 1;

  if [ -z "$(/usr/local/bin/brew list $package_name)" ]; then
    brew install $package_name
  else
    brew upgrade $package_name 2> /dev/null
  fi
}
