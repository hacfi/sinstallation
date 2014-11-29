################################################################################
#                                 Dashboard
################################################################################

source './keyboard_shortcuts.sh'

# Toggle Whether Dashboard is Enabled
function osx_dashboard {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.dashboard mcx-disabled -bool $enabled

  local dashboard_keyboard_shortcut_ids=(62 63)

  for keyboard_shortcut_id in "${dashboard_keyboard_shortcut_ids[@]}"; do
    osx_keyboard_shortcut_toggle $keyboard_shortcut_id $enabled
  done
}
