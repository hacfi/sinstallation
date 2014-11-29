################################################################################
#                                  Security
################################################################################

function osx_security_system_preference_lock {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  sudo sh -c "$path_to_plistbuddy -c 'Delete :rights:system.preferences:shared' /etc/authorization 2> /dev/null"
  sudo sh -c "$path_to_plistbuddy -c 'Add :rights:system.preferences:shared bool ${enabled}' /etc/authorization"
}

function osx_security_auditing {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="load"; else enabled="unload"; fi; shift 1;

  sudo sh -c "launchctl $enabled -w /System/Library/LaunchDaemons/com.apple.auditd.plist 2> /dev/null"
}

# Toggles Whether the FileVault Key is Stored Even When the System is in Standby
function osx_security_destroy_filevault_key_in_standby_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi; shift 1;

  sudo pmset -a destroyfvkeyonstandby $enabled
}

function osx_security_send_safari_search_suggestions_to_apple {
  local enabled;     if [[ "$1" == "enabled" ]]; then enabled="true";      else enabled="false";    fi;
  local enabled_inv; if [[ "$1" == "enabled" ]]; then enabled_inv="false"; else enabled_inv="true"; fi;
  shift 1;

  defaults write com.apple.Safari UniversalSearchEnabled    -bool $enabled
  defaults write com.apple.Safari SuppressSearchSuggestions -bool $enabled_inv
}
