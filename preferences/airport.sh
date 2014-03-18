################################################################################
#                                   Airport
################################################################################

path_to_airport_binary="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"

# Toggle Airport "Disconnect On Logout" Preference
function osx_airport_disconnect_on_logout {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="YES"; else enabled="NO"; fi

  sudo $path_to_airport_binary prefs DisconnectOnLogout=${enabled}
}

# Set What to Do When Preferred Networks Are Available
# 
# Modes: Automatic | Preferred | Ranked | Recent | Strongest
function osx_airport_join_mode {
  local mode="$1"; shift 1;

  sudo $path_to_airport_binary prefs JoinMode=${mode}
}

# Set What to Do When None of the Preferred Networks Are Available
#
# Modes: Prompt | JoinOpen | KeepLooking | DoNothing
function osx_airport_join_mode_fallback {
  local mode="$1"; shift 1;

  sudo $path_to_airport_binary prefs JoinModeFallback=${mode}
}

# Toggle Airport "Remember Recent Networks" Preference
function osx_airport_remember_recent_networks {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="YES"; else enabled="NO"; fi

  sudo $path_to_airport_binary prefs RememberRecentNetworks=${enabled}
}

# Toggle Airport "Require Password for Computer-to-Computer Networks" Preference
function osx_airport_require_password_for_computer_to_computer_networks {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="YES"; else enabled="NO"; fi

  sudo $path_to_airport_binary prefs RequireAdminIBSS=${enabled}
}

# Toggle Airport "Require Password to Change Networks" Preference
function osx_airport_require_password_to_change_networks {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="YES"; else enabled="NO"; fi

  sudo $path_to_airport_binary prefs RequireAdminNetworkChange=${enabled}
}

# Toggle Airport "Require Password to Turn Wi-Fi On or Off" Preference
function osx_airport_require_password_to_toggle_power {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="YES"; else enabled="NO"; fi

  sudo $path_to_airport_binary prefs RequireAdminPowerToggle=${enabled}
}
