################################################################################
#                                  Security
################################################################################

function osx_security_system_preference_lock {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  sudo sh -c "$path_to_plistbuddy -c 'Delete :rights:system.preferences:shared' /etc/authorization 2> /dev/null"
  sudo sh -c "$path_to_plistbuddy -c 'Add :rights:system.preferences:shared bool ${enabled}' /etc/authorization"
}

function osx_security_auditing {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="load"; else enabled="unload"; fi; shift 1;

  sudo sh -c "launchctl $enabled -w /System/Library/LaunchDaemons/com.apple.auditd.plist 2> /dev/null"
}

function osx_security_firmware_password {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  if [[ "$enabled" == "true" ]]; then
    if ! [ -n "$(nvram -p | grep security-mode)" ]; then
      echo -n "Enter the password you would like for your firmware password:"
      read firmware_password
      sudo nvram security-password=$firmware_password
      sudo nvram security-mode=full
    fi
  else
    sudo nvram -d security-password
    sudo nvram security-mode=none
  fi
}

# Toggles Whether the FileVault Key is Stored Even When the System is in Standby
function osx_security_destroy_filevault_key_in_standby_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi; shift 1;

  sudo pmset -a destroyfvkeyonstandby $enabled
}
