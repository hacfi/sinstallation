################################################################################
#                                  Desktop  
################################################################################

function osx_desktop {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder CreateDesktop -bool $enabled
}

# Show internal drives on the desktop
function osx_desktop_displayed_item {
  local key="$1"; shift 1;
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  case "$key" in
  internal_hard_drives)
    key="ShowHardDrivesOnDesktop";;
  external_hard_drives)
    key="ShowExternalHardDrivesOnDesktop";;
  mounted_servers)
    key="ShowMountedServersOnDesktop";;
  removable_media)
    key="ShowRemovableMediaOnDesktop";;
  esac

  defaults write com.apple.finder $key -bool $enabled
}

function osx_desktop_icon_size {
  local size="$1"; shift 1;
  local grid_spacing="$1"; shift 1;

  defaults write com.apple.finder DesktopViewOptions.IconSize -int $size
  defaults write com.apple.finder DesktopViewOptions.GridSpacing -int $grid_spacing

  $path_to_plistbuddy -c "Delete :DesktopViewSettings:IconViewSettings:iconSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :DesktopViewSettings:IconViewSettings:iconSize integer $size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null

  $path_to_plistbuddy -c "Delete :DesktopViewSettings:IconViewSettings:gridSpacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :DesktopViewSettings:IconViewSettings:gridSpacing integer $grid_spacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null

  osx_preferences_synchronize com.apple.finder
}
