################################################################################
#                               Keyboard Shortcuts
################################################################################

function osx_keyboard_shortcut_toggle {
  local keyboard_shortcut_id="$1"; shift 1;
  local enabled="$1"; shift 1;
  local plist_path="/Users/$(whoami)/Library/Preferences/com.apple.symbolichotkeys.plist"

  $path_to_plistbuddy -c "Delete :AppleSymbolicHotKeys:$keyboard_shortcut_id:enabled" $plist_path 2> /dev/null
  $path_to_plistbuddy -c "Add :AppleSymbolicHotKeys:$keyboard_shortcut_id:enabled boolean $enabled" $plist_path 2> /dev/null
}
