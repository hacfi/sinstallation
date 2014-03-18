################################################################################
#                                   Login  
################################################################################

# Toggles Whether to Automatically Login a User
function osx_login_auto_login_user {
  local username; if [[ "$1" == "disabled" ]]; then username=""; else username="$1"; fi; shift 1;

  if [[ "$username" == "" ]]; then
    sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser 2> /dev/null
    sudo rm -f /etc/kcpassword
  else
    sudo defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser -string "$username"
  fi
}

# Toggles Whether Allow Fast User Switching
function osx_login_fast_user_switching {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  sudo defaults write NSGlobalDomain MultipleSessionEnabled -bool $enabled
}

# Toggles Whether to Allow the Guest Account to Login
function osx_login_guest {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi; shift 1;

  sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -int $enabled
}

# Toggles Whether to Show Power Options on the Login Screen
function osx_login_power_options {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  sudo defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool $enabled
}

# Show Admin Information when Clicking the Clock on the Login Screen
function osx_login_admin_information {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  if [[ "$enabled" == "true" ]]; then
    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
  else
    sudo defaults delete /Library/Preferences/com.apple.loginwindow AdminHostInfo
  fi
}

# Number of Attempts Before Password Hint is Shown
function osx_login_retries_before_hint {
  local attempts="$1"; shift 1;

  sudo defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int $attempts
}

# TODO add more styles
#
# Set the default login screen style
function osx_login_style {
  local mode

  case "$1" in
  name_and_password)
    mode="true";;
  *)
    mode="false";;
  esac

  defaults write com.apple.loginwindow SHOWFULLNAME -bool $mode
}

# Toggle Whether to Display Users with UID Less Than 500
function osx_login_show_secure_users {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  sudo defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool $enabled
}
