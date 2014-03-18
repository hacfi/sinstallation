################################################################################
#                                   Trash         
################################################################################

# Toggle the Warning when Emptying the Trash
function osx_trash_warn_when_emptying {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder WarnOnEmptyTrash -bool $enabled
}

# Toggle Whether Emptying the Trash is Done Securely
function osx_trash_securely_empty_trash {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder EmptyTrashSecurely -bool $enabled
}
