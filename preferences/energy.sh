################################################################################
#                                   Energy
################################################################################

# Set Time Until Disk Sleeps
function osx_energy_disk_sleep {
  local on_battery="$1"; shift 1;
  local when_plugged_in="$1"; shift 1;

  sudo pmset -b disksleep ${on_battery}
  sudo pmset -c disksleep ${when_plugged_in}
}

# Set Time Until Display Sleeps
function osx_energy_display_sleep {
  local on_battery="$1"; shift 1;
  local when_plugged_in="$1"; shift 1;

  sudo pmset -b displaysleep ${on_battery}
  sudo pmset -c displaysleep ${when_plugged_in}
}

# Set Time Until the System Hibernates
function osx_energy_hibernation {
  local on_battery="$1"; shift 1;
  local when_plugged_in="$1"; shift 1;

  sudo pmset -b standbydelay ${on_battery}
  sudo pmset -c standbydelay ${when_plugged_in}
}

# Set Time Until System Sleeps
function osx_energy_sleep {
  local on_battery="$1"; shift 1;
  local when_plugged_in="$1"; shift 1;

  sudo pmset -b sleep ${on_battery}
  sudo pmset -c sleep ${when_plugged_in}
}

# Toggle Whether Power Nap is Enabled
function osx_energy_power_nap {
  local on_battery; if [[ "$1" == "enabled" ]]; then on_battery="1"; else on_battery="0"; fi; shift 1;
  local when_plugged_in; if [[ "$1" == "enabled" ]]; then when_plugged_in="1"; else when_plugged_in="0"; fi; shift 1;

  sudo pmset -b darkwakes ${on_battery}
  sudo pmset -c darkwakes ${when_plugged_in}
}

function osx_energy_power_button_sleeps_system {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool $enabled
}
