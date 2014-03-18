################################################################################
#                                 Hot Corners
################################################################################

# Set actions for each corner when the mouse moves into it
function osx_hot_corners {
  local corner;
  local action;
  local modifier;

  case "$1" in
  bottom_left)
    corner="bl";;
  bottom_right)
    corner="br";;
  top_right)
    corner="tr";;
  top_left)
    corner="tl";;
  *)
    mode="$1";;
  esac
  shift 1;

  case "$1" in
  do_nothing)
    action=0;;
  mission_control)
    action=2;;
  show_application_windows)
    action=3;;
  desktop)
    action=4;;
  start_screensaver)
    action=5;;
  disable_screensaver)
    action=6;;
  dashboard)
    action=7;;
  sleep_display)
    action=10;;
  launchpad)
    action=11;;
  notification_center)
    action=12;;
  *)
    action="$1";;
  esac
  shift 1;

  case $1 in
  true)
    modifier=1;;
  *)
    modifier=0;;
  esac

  defaults write com.apple.dock wvous-${corner}-corner -int $action
  defaults write com.apple.dock wvous-${corner}-modifier -int $modifier
}

