function keep_sudo_alive {
  # Ask for the administrator password upfront
  sudo -v
  
  # Keep-alive: update existing `sudo` time stamp until `.osx` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}
