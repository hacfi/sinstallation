################################################################################
#                                Quicklook 
################################################################################

# Toggle Whether You Can Select Text in a QuickLook Window
function osx_quicklook_text_selection {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder QLEnableTextSelection -bool $enabled
}

# Toggle whether QuickLook is hidden when switching to a different app 
function osx_quicklook_hide_on_deactivation {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder QLHidePanelOnDeactivate -bool $enabled
}
