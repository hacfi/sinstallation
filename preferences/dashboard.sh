################################################################################
#                                 Dashboard     
################################################################################

# Toggle Whether Dashboard is Enabled
function osx_dashboard {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dashboard mcx-disabled -bool $enabled
}
