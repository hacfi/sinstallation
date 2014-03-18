################################################################################
#                              Trackpad (and Mice)  
################################################################################

# --------------------------------------------------------------------------------
#                               One Finger Single Tap
# --------------------------------------------------------------------------------

function osx_trackpad_tap_to_click {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  local enabled_int; if [[ "$1" == "enabled" ]]; then enabled_int="true"; else enabled_int="false"; fi
  shift 1;

  # Toggle Tap-To-Click on Internal Touchpad
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int $enabled_int
  defaults write com.apple.AppleMultitouchTrackpad Clicking -bool $enabled

  # Toggle Tap-To-Click on External Touchpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool $enabled
}

# --------------------------------------------------------------------------------
#                               Two Finger Single Tap
# --------------------------------------------------------------------------------

function osx_trackpad_secondary_click {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  local mode; if [[ "$1" == "enabled" ]]; then mode="TwoButton"; else mode="OneButton"; fi
  shift 1

  # Toggle Secondary "Right" Click on Internal Touchpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool $enabled
  defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool $enabled

  # Toggle Secondary "Right" Click on External Touchpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool $enabled

  # Toggle Secondary "Right" Click on Magic Mouse
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode $mode
}

# --------------------------------------------------------------------------------
#                              Three Finger Single Tap
# --------------------------------------------------------------------------------

function osx_trackpad_three_finger_tap {
  local mode

  case $1 in
  look_up_definition)
    mode="2";;
  disabled)
    mode="0";;
  *)
    mode="$1";;
  esac

  # For Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int $mode

  # For External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int $mode
}

# --------------------------------------------------------------------------------
#                               Four Finger Single Tap
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                                One Finger Double Tap
# --------------------------------------------------------------------------------

# This applies to external mice only
function osx_mouse_one_finger_double_tap {
  local mode

  case $1 in
  smart_zoom)
    mode="1";;
  mission_control)
    mode="3";;
  disabled)
    mode="0";;
  *)
    mode="$1";;
  esac

  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseOneFingerDoubleTapGesture -int $mode
}

# --------------------------------------------------------------------------------
#                                Two Finger Double Tap
# --------------------------------------------------------------------------------

function osx_trackpad_two_finger_double_tap {
  local mode

  case $1 in
  smart_zoom)
    mode="1";;
  mission_control)
    mode="3";;
  disabled)
    mode="0";;
  *)
    mode="$1";;
  esac

  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.twoFingerDoubleTapGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int $mode

  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int $mode

  # External Mouse
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerDoubleTapGesture -int $mode
}

# --------------------------------------------------------------------------------
#                               Three Finger Double Tap
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                                Four Finger Double Tap
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                              One Finger Horizontal Swipe
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                              Two Finger Horizontal Swipe
# --------------------------------------------------------------------------------

function osx_trackpad_two_finger_horizontal_swipe {
  local mode

  case $1 in
  disabled)
    mode="0";;
  horizontal_scroll)
    mode="0";;
  switch_pages)
    mode="1";;
  switch_spaces)
    mode="2";;
  *)
    mode="$1";;
  esac

  # Internal/External Trackpads
  if [[ "$mode" == "1" ]]; then
    defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
  else
    defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false
  fi
  
  # External Mouse
  defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int $mode
}

# --------------------------------------------------------------------------------
#                             Three Finger Horizontal Swipe
# --------------------------------------------------------------------------------

# Sets the Effect for Swiping Left/Right with Three Fingers
function osx_trackpad_three_finger_horizontal_swipe {
  local mode;

  case "$1" in
  disabled)
    mode="0";;
  switch_pages)
    mode="1";;
  switch_apps)
    mode="2";;
  *)
    mode="$1";;
  esac

  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int $mode

  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int $mode
}

# --------------------------------------------------------------------------------
#                              Four Finger Horizontal Swipe
# --------------------------------------------------------------------------------

# Sets the Effect for Swiping Left/Right with Four Fingers
function osx_trackpad_four_finger_horizontal_swipe {
  local mode;

  case "$1" in
  switch_apps)
    mode="2";;
  disabled)
    mode="0";;
  *)
    mode="$1";;
  esac

  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.fourFingerHorizSwipeGesture $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int $mode

  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture $mode
}

# --------------------------------------------------------------------------------
#                               One Finger Vertical Swipe
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                               Two Finger Vertical Swipe
# --------------------------------------------------------------------------------

# Scrolling... Duh

# --------------------------------------------------------------------------------
#                              Three Finger Vertical Swipe
# --------------------------------------------------------------------------------

function osx_trackpad_three_finger_vertical_swipe {
  local mode;

  case "$1" in
  mission_control)
    mode="2";;
  expose)
    mode="2";;
  disabled)
    mode="1";;
  *)
    mode="$1";;
  esac

  if [[ "$1" == "mission_control" ]]; then
    defaults write com.apple.dock showMissionControlGestureEnabled -bool true
  elif [[ "$1" == "expose" ]]; then
    defaults write com.apple.dock showAppExposeGestureEnabled -bool true
  else
    defaults write com.apple.dock showMissionControlGestureEnabled -bool false
    defaults write com.apple.dock showAppExposeGestureEnabled -bool false
  fi

  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int $mode
  
  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int $mode
}

# --------------------------------------------------------------------------------
#                               Four Finger Vertical Swipe
# --------------------------------------------------------------------------------

function osx_trackpad_four_finger_vertical_swipe {
  local mode;

  case "$1" in
  mission_control)
    mode="2";;
  expose)
    mode="2";;
  disabled)
    mode="1";;
  *)
    mode="$1";;
  esac

  if [[ "$1" == "mission_control" ]]; then
    defaults write com.apple.dock showMissionControlGestureEnabled -bool true
  elif [[ "$1" == "expose" ]]; then
    defaults write com.apple.dock showAppExposeGestureEnabled -bool true
  else
    defaults write com.apple.dock showMissionControlGestureEnabled -bool false
    defaults write com.apple.dock showAppExposeGestureEnabled -bool false
  fi

  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.fourFingerVertSwipeGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int $mode
  
  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int $mode
}

# --------------------------------------------------------------------------------
#                                     One Finger Drag
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                                     Two Finger Drag
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                                    Three Finger Drag
# --------------------------------------------------------------------------------

function osx_trackpad_three_finger_drag {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  
  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool $enabled
  defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool $enabled

  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool $enabled
}

# --------------------------------------------------------------------------------
#                                     Four Finger Drag
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                                     One Finger Pinch
# --------------------------------------------------------------------------------

# You must be dreaming...

# --------------------------------------------------------------------------------
#                                     Two Finger Pinch
# --------------------------------------------------------------------------------

# Zoom In/Out
function osx_trackpad_two_finger_pinch {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  # Internal Trackpad 
  sudo defaults write NSGlobalDomain com.apple.trackpad.pinchGesture -bool $enabled
  defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool $enabled

  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool $enabled
}

# --------------------------------------------------------------------------------
#                                    Three Finger Pinch
# --------------------------------------------------------------------------------

# N/A

# --------------------------------------------------------------------------------
#                                     Four Finger Pinch
# --------------------------------------------------------------------------------

function osx_trackpad_four_finger_pinch {
  local mode;

  case "$1" in
  launchpad)
    mode="2";;
  desktop)
    mode="2";;
  disabled)
    mode="0";;
  *)
    mode="$1";;
  esac

  if [[ "$1" == "launchpad" ]]; then
    defaults write com.apple.dock showLaunchpadGestureEnabled -bool true
  elif [[ "$1" == "desktop" ]]; then
    defaults write com.apple.dock showLaunchpadGestureEnabled -bool true
  else
    defaults write com.apple.dock showLaunchpadGestureEnabled -bool false
  fi

  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.fourFingerPinchSwipeGesture -int $mode
  sudo defaults write NSGlobalDomain com.apple.trackpad.fiveFingerPinchSwipeGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int $mode
  
  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int $mode
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int $mode
}

# --------------------------------------------------------------------------------
#                                     Five Finger Pinch
# --------------------------------------------------------------------------------

# Same as Four Finger Pinch
function osx_trackpad_five_finger_pinch {
  osx_trackpad_four_finger_pinch "$@"
}

# --------------------------------------------------------------------------------
#                                    Swipe From Right Edge
# --------------------------------------------------------------------------------

# Notifications Center.
function osx_trackpad_swipe_from_right_edge {
  local mode; if [[ "$1" == "notification_center" ]]; then mode="3"; else mode="0"; fi

  # Internal Trackpad
  sudo defaults write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int $mode
  defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int $mode

  # External Trackpad
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int $mode
}

# --------------------------------------------------------------------------------
#                                          Rotation
# --------------------------------------------------------------------------------

function osx_trackpad_rotation {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  # Internal Trackpad 
  sudo defaults write NSGlobalDomain com.apple.trackpad.rotateGesture -bool $enabled
  defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool $enabled

  # External Trackpad 
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool $enabled
}

# --------------------------------------------------------------------------------
#                                          Dragging
# --------------------------------------------------------------------------------

# Toggle the Ability Drag with an External Touchpad
function osx_trackpad_tap_to_drag {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  # Internal Trackpad 
  defaults write com.apple.AppleMultitouchTrackpad Dragging -int $enabled

  # External Trackpad 
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int $enabled
}

# --------------------------------------------------------------------------------
#                                          Movement
# --------------------------------------------------------------------------------

function osx_mouse_movement {
  local scaling="$1"; shift 1;
  local scrolling_speed="$1"; shift 1;

  # Sets the Speed With Which Mouse Movement Moves the Cursor
  defaults write NSGlobalDomain com.apple.mouse.scaling -float $scaling

  # Sets the Speed With Which the Mouse Scrolls Content
  defaults write NSGlobalDomain com.apple.mouse.scrolling -float $scrolling_speed
}

function osx_trackpad_movement {
  local scaling="$1"; shift 1;
  local scrolling_speed="$1"; shift 1;

  # Sets the Speed With Which Trackpad Movement Moves the Cursor
  sudo defaults write NSGlobalDomain com.apple.trackpad.scaling -float $scaling

  # Sets the Speed With Which the Trackpad Scrolls Content
  sudo defaults write NSGlobalDomain com.apple.trackpad.scrolling -float $scrolling_speed
}
