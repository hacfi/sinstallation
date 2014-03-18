################################################################################
#                                   Dialogs
################################################################################

# Expand print panel by default
function osx_dialogs_auto_expanding_print_dialog {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool $enabled
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool $enabled
}

# Expand save panel by default
function osx_dialogs_auto_expanding_save_dialog {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool $enabled
}

# TODO: Let the user pass in readable values instead of 1, 2, 3, etc.
#
# Like 'list', 'icon-grid', etc. fill out options
#
# File Dialog File View Mode
function osx_dialogs_file_view_mode {
  local mode

  case $1 in
  icon-grid)
    mode="1";;
  list)
    mode="2";;
  *)
    mode="$1";;
  esac

  defaults write NSGlobalDomain NavPanelFileListModeForOpenMode -int $mode
  defaults write NSGlobalDomain NSNavPanelFileListModeForOpenMode2 -int $mode
  defaults write NSGlobalDomain NSNavPanelFileLastListModeForOpenModeKey -int $mode
  defaults write NSGlobalDomain NSNavPanelFileLastListModeForSaveModeKey -int $mode
  defaults write NSGlobalDomain NSNavPanelFileListModeForSaveMode2 -int $mode
  defaults write NSGlobalDomain NavPanelFileListModeForSaveMode -int $mode
}
