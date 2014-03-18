################################################################################
#                                   Airdrop
################################################################################

# Toggle Whether AirDrop Allows You to "Drop" to Any Interface
function osx_airdrop_access_all_interfaces {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool $enabled
}
