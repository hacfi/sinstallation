################################################################################
#                                Time Machine
################################################################################

# Toggle Whether Time Machine Asks to Use New Disks for Backup
function osx_time_machine_ask_to_use_new_disks_for_backup {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi

  defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool $enabled
}

# Toggle Whether Unsupported Network Volumes are Displayed in Time Machine
function osx_time_machine_unsupported_network_volumes {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes -bool $enabled
}

# Toggle Whether Local Time Machine Backups are Enabled
function osx_time_machine_local_backups {
  local enabled; if [[ "$1" == "enable" ]]; then enabled="enable"; else enabled="disable"; fi

  sudo tmutil ${enabled}local
}

function osx_time_machine_add_exclusion {
  sudo defaults write /Library/Preferences/com.apple.TimeMachine SkipPaths -array-add "$1"
  sudo tmutil addexclusion -p "$1"
}

function osx_time_machine_backup_interval {
  local interval="$1"; shift 1;

  $path_to_plistbuddy -c "Delete :LaunchEvents:com.apple.xpc.activity:com.apple.backupd-auto:Interval" /System/Library/LaunchDaemons/com.apple.backupd-auto.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :LaunchEvents:com.apple.xpc.activity:com.apple.backupd-auto:Interval integer $interval" /System/Library/LaunchDaemons/com.apple.backupd-auto.plist 2> /dev/null

  $path_to_plistbuddy -c "Delete :LaunchEvents:com.apple.xpc.activity:com.apple.backupd-auto:Delay" /System/Library/LaunchDaemons/com.apple.backupd-auto.plist 2> /dev/null
  $path_to_plistbuddy -c "Add :LaunchEvents:com.apple.xpc.activity:com.apple.backupd-auto:Delay integer $interval" /System/Library/LaunchDaemons/com.apple.backupd-auto.plist 2> /dev/null

  osx_preferences_synchronize com.apple.backupd
  osx_preferences_synchronize com.apple.backupd-auto
}
