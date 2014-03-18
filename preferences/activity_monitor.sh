################################################################################
#                               Activity Monitor
################################################################################

# Show the main window when launching Activity Monitor
function osx_activity_monitor_open_main_window {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.ActivityMonitor OpenMainWindow -bool $enabled
}

# Activity Monitor Dock Icon Graph
function osx_activity_monitor_icon_mode {
  local mode;

  case "$1" in
  cpu_usage)
    mode="5";;
  *)
    mode="$1";;
  esac

  defaults write com.apple.ActivityMonitor IconType -int $mode
}

# Process List Items in Activity Monitor
function osx_activity_monitor_processes_to_list {
  local mode;

  case "$1" in
  all_processes)
    mode="0";;
  *)
    mode="$1";;
  esac

  defaults write com.apple.ActivityMonitor ShowCategory -int $mode
}
