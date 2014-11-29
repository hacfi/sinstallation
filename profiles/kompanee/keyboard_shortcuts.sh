################################################################################
#                               Keyboard Shortcuts
################################################################################

source './keyboard_shortcuts.sh'

###
# Legend
#
# 36, 37                          - Show Desktop
# 33, 35                          - Application Window
# 52                              - Toggle Dock Hiding
# 59, 162                         - Accessibility Shortcuts
# 98                              - Help Menu
# 10, 11, 12, 13, 51, 57, 7, 8, 9 - Keyboard Focus
#
function set_keyboard_shortcuts {
  local keyboard_shortcuts_to_disable=(7 8 9 10 11 12 13 33 35 36 37 51 52 57 59 162)

  for keyboard_shortcut_id in "${keyboard_shortcuts_to_disable[@]}"; do
    osx_keyboard_shortcut_toggle $keyboard_shortcut_id false
  done
}
