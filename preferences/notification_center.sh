################################################################################
#                             Notification Center
################################################################################

function osx_notification_center_banner_delay {
  local seconds="$1"; shift 1;

  defaults write com.apple.notificationcenterui bannerTime $seconds
}
