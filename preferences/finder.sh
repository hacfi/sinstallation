################################################################################
#                                    Finder
################################################################################

# Toggle the Ability to Quit Finder
function osx_finder_allow_quit {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder QuitMenuItem -bool $enabled
}

# Toggle Whether to Enable Finder Animations
function osx_finder_animations {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  local inverse_enabled; if [[ "$1" == "enabled" ]]; then inverse_enabled="false"; else inverse_enabled="true"; fi

  defaults write com.apple.finder DisableAllAnimations -bool $inverse_enabled
  defaults write com.apple.finder AnimateInfoPanes -bool $enabled
  defaults write com.apple.finder AnimateSnapToGrid -bool $enabled
  defaults write com.apple.finder ZoomRects -bool $enabled
  defaults write com.apple.finder AnimateWindowZoom -bool $enabled
}

# Toggle Whether Finder will Always Display All File Extensions
function osx_finder_file_extensions_always_display {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain AppleShowAllExtensions -bool $enabled
}

# Toggle the Warning When Changing a File Extension
function osx_finder_file_extensions_warn_on_change {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool $enabled
}

# Toggle Whether to Show the Finder Path Bar
function osx_finder_path_bar {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;
  local enabled_int; if [[ "$1" == "enabled" ]]; then enabled_int="1"; else enabled_int="0"; fi; shift 1;

  defaults write com.apple.finder ShowPathbar -bool $enabled
  defaults write com.apple.finder PathBarRootAtHome -int $enabled_int
}

# Toggle Whether to Show the Full POSIX Path in the Finder Titlebar
function osx_finder_posix_title_path {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder _FXShowPosixPathInTitle -bool $enabled
}

# Toggle Whether to Show the Finder Status Bar
function osx_finder_status_bar {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder ShowStatusBar -bool $enabled
}

# Mode: relative | absolute
function osx_finder_date_format {
  local mode;

  case "$1" in
  relative)
    mode="true";;
  absolute)
    mode="false";;
  *)
    mode="$1";;
  esac

  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:ListViewSettings:useRelativeDates" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:ListViewSettings:useRelativeDates string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:ExtendedListViewSettings:useRelativeDates string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :StandardViewSettings:ListViewSettings:useRelativeDates" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:ListViewSettings:useRelativeDates string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :StandardViewSettings:ExtendedListViewSettings:useRelativeDates" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:ExtendedListViewSettings:useRelativeDates string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:ListViewSettings:useRelativeDates" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:ListViewSettings:useRelativeDates string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:ExtendedListViewSettings:useRelativeDates" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:ExtendedListViewSettings:useRelativeDates string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist

  osx_preferences_synchronize com.apple.finder
}

# Set the File View Mode Used By Default When Opening New Finder Windows
#
# Values: Nlsv, icnv, clmv, or Flwv
function osx_finder_default_file_view_mode {
  local mode;

  case "$1" in
  list)
    mode="Nlsv";;
  icon)
    mode="icnv";;
  column)
    mode="clmv";;
  cover_flow)
    mode="Flwv";;
  *)
    mode="$1";;
  esac

  defaults write com.apple.finder FXPreferredViewStyle $mode
  defaults write com.apple.finder FK_SavedViewStyle $mode
}

# Set the Default Location Used When Opening a New Window in Finder
#
# For custom location, pass in a second parameter which is the path to open in
function osx_finder_default_location {
  local mode;
  local custom_location;

  case "$1" in
  computer)
    mode="PfCm";;
  volume)
    mode="PfVo";;
  desktop)
    mode="PfDe";;
  documents)
    mode="PfDo";;
  all_my_files)
    mode="PfAF";;
  home)
    mode="PfHm";;
  custom)
    mode="PfLo";;
  *)
    mode="$1";;
  esac
  shift 1;

  custom_location="$1"; shift 1;

  defaults write com.apple.finder NewWindowTarget $mode

  if [[ "$custom_location" != "" ]]; then
    defaults write com.apple.finder NewWindowTargetPath $custom_location
  fi
}

# Set the Default Scope Used When Using The Search Box in Finder
#
# TODO: Let the user pass in readable values add to list of possible values
function osx_finder_default_search_scope {
  local mode;

  case "$1" in
  current_folder)
    mode="SCcf";;
  *)
    mode="$1";;
  esac

  defaults write com.apple.finder FXDefaultSearchScope $mode
}

# TODO add more styles
#
# Mode: grid
function osx_finder_icon_arrangement {
  local mode="$1"; shift 1;

  $path_to_plistbuddy -c "Delete :FK_DefaultIconViewSettings:arrangeBy" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_DefaultIconViewSettings:arrangeBy string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :DesktopViewSettings:IconViewSettings:arrangeBy" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :DesktopViewSettings:IconViewSettings:arrangeBy string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:IconViewSettings:arrangeBy" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:IconViewSettings:arrangeBy string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :StandardViewSettings:IconViewSettings:arrangeBy" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:IconViewSettings:arrangeBy string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:IconViewSettings:arrangeBy" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:IconViewSettings:arrangeBy string ${mode}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist

  osx_preferences_synchronize com.apple.finder
}

# Remove All Existing Icon Previews
function osx_finder_icon_previews {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  $path_to_plistbuddy -c "Delete :FK_DefaultIconViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_DefaultIconViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:IconViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:IconViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:ListViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:ListViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:ExtendedListViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:ExtendedListViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :StandardViewSettings:IconViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:IconViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :StandardViewSettings:ListViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:ListViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :StandardViewSettings:ExtendedListViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:ExtendedListViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:IconViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:IconViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:ListViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:ListViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:ExtendedListViewSettings:showIconPreview" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:ExtendedListViewSettings:showIconPreview bool ${enabled}" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist

  defaults delete com.apple.finder FXRecentFolders 2> /dev/null

  osx_preferences_synchronize com.apple.finder
}

# Toggles Whether Springing is Enabled
# Sets the Delay Before a Hovered Item "Springs"
function osx_finder_springing {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;
  local delay="$1"; shift 1;

  defaults write NSGlobalDomain com.apple.springing.enabled -bool $enabled
  defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool $enabled
  defaults write NSGlobalDomain com.apple.springing.delay -float $delay
}

# Public: Unhide ~/Library in Finder.
function osx_finder_unhide_library {
  chflags nohidden ${HOME}/Library
}

# Expand the "Open with" and "Sharing & Permissions" panes
function osx_finder_info_pane_expansion {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General    -bool $enabled \
    OpenWith   -bool $enabled \
    Privileges -bool $enabled
}

# Minimum icon size for playable previews 
function osx_finder_minimum_playable_preview_size {
  local size="$1"; shift 1;

  defaults write com.apple.finder QLInlinePreviewMinimumSupportedSize -int $size
}

# Toggle whether to autostop previews when scrolling
function osx_finder_autostop_previews_when_scrolling {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder AutoStopWhenScrollingOffBounds -bool $enabled
}

# Toggle whether to autostop previews when selection changes
function osx_finder_autostop_previews_when_selection_changes {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder AutoStopWhenSelectionChanges -bool $enabled
}

# Toggle whether, when clicking through to a finder window, the current selection can be destroyed
function osx_finder_clickthrough_destroys_selection {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.finder ClickThroughDestroysSelection -bool $enabled
}

# Toggle whether recent items or just current items are shown under the "Shared" menu
function osx_finder_recent_locations_in_shared_menu {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.NetworkBrowser EnableAllRecents -bool $enabled
}

function osx_finder_icon_view_icon_size_and_spacing {
  local size="$1"; shift 1;
  local spacing="$1"; shift 1;
  local font_size="$1"; shift 1;

  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:IconViewSettings:iconSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:IconViewSettings:iconSize integer $size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :StandardViewSettings:IconViewSettings:iconSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:IconViewSettings:iconSize integer $size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:IconViewSettings:iconSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:IconViewSettings:iconSize integer $size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :FK_DefaultIconViewSettings:iconSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_DefaultIconViewSettings:iconSize integer $size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null

  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:IconViewSettings:textSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:IconViewSettings:textSize integer $font_size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :StandardViewSettings:IconViewSettings:textSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:IconViewSettings:textSize integer $font_size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:IconViewSettings:textSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:IconViewSettings:textSize integer $font_size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :FK_DefaultIconViewSettings:textSize" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_DefaultIconViewSettings:textSize integer $font_size" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null

  $path_to_plistbuddy -c "Delete :FK_StandardViewSettings:IconViewSettings:gridSpacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_StandardViewSettings:IconViewSettings:gridSpacing integer $spacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :StandardViewSettings:IconViewSettings:gridSpacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :StandardViewSettings:IconViewSettings:gridSpacing integer $spacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :ComputerViewSettings:IconViewSettings:gridSpacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :ComputerViewSettings:IconViewSettings:gridSpacing integer $spacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Delete :FK_DefaultIconViewSettings:gridSpacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :FK_DefaultIconViewSettings:gridSpacing integer $spacing" /Users/$(whoami)/Library/Preferences/com.apple.finder.plist 2> /dev/null

  osx_preferences_synchronize com.apple.finder
}
