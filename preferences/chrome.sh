################################################################################
#                                     Chrome
################################################################################

function chrome_use_system_print_dialog {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.google.Chrome DisablePrintPreview        -bool $enabled
  defaults write com.google.Chrome.canary DisablePrintPreview -bool $enabled
}

function chrome_allow_swipe_to_navigate {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool $enabled
  defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool $enabled
}
