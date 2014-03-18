################################################################################
#                                   System        
################################################################################

# Toggle Whether Software Updates are Downloaded in the Background when Available
function osx_system_update_automatic_downloads {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  sudo defaults write AutomaticDownload /Library/Preferences/com.apple.SoftwareUpdate -bool $enabled
}

# Toggle Whether Software Update Prefers the Apple CDN
function osx_system_update_local_cdn {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  sudo defaults write com.apple.SoftwareUpdate /Library/Preferences/com.apple.SoftwareUpdate -bool $enabled
}

# Toggle the Downloaded App Quarantine
function osx_system_app_quarantine {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write com.apple.LaunchServices LSQuarantine -bool $enabled
}

# Toggle Whether to Quit Apps Which Have Been Idle
function osx_system_automatic_app_termination {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  defaults write NSGlobalDomain NSDisableAutomaticTermination -bool $enabled
}

# Toggle Whether to Save Versions of Documents
function osx_system_document_versioning {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain ApplePersistence -bool $enabled

  if [[ "$enabled" == "false" ]]; then
    sudo rm -rf /.DocumentRevisions-V1*
    defaults write NSGlobalDomain AutosavingDelay -int 0
  else
    sudo mkdir /.DocumentRevisions-V100 2> /dev/null
    defaults delete NSGlobalDomain AutosavingDelay 2> /dev/null
  fi
}

# Toggle the Dialog to Sent Usage Statistics to Apple
function osx_system_crash_reporter {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;
  local mode="$1"; shift 1;

  defaults write com.apple.CrashReporter DialogType $mode
  defaults write com.apple.SubmitDiagInfo AutoSubmit -bool $enabled
}

# Toggle Whether to Save New Documents to iCloud by Default
function osx_system_save_documents_to_icloud_by_default {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  local enabled_neg; if [[ "$1" == "enabled" ]]; then enabled_neg="false"; else enabled_neg="true"; fi

  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool $enabled
  defaults write kCFPreferencesCurrentApplication com.apple.PreferenceSync.ExcludeAllSyncKeys -bool $enabled_neg
}

# Toggle Whether to Save Windows and Positions when Restarting/Quitting
function osx_system_save_windows_on_quit {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool $enabled
  defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool $enabled
  defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool $enabled
  defaults write com.apple.loginwindow TALLogoutSavesState -bool $enabled
  defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool $enabled
}

# TODO: Add the rest of the frequencies
# Sets the Interval Between Software Update Checks
function osx_system_update_schedule {
  local interval

  case "$1" in
  daily)
    interval="1";;
  weekly)
    interval="7";;
  biweekly)
    interval="14";;
  monthly)
    interval="30";;
  *)
    interval="$1";;
  esac

  sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency -int $interval
}

# Update Computer NetBIOS Host Name
function osx_system_host_name {
  local value="$1"; shift 1;

  sudo sh -c "hostname ${value}"
  sudo sh -c "scutil --set ComputerName ${value}"
  sudo sh -c "scutil --set HostName ${value}"
  sudo sh -c "scutil --set LocalHostName ${value}"
  sudo sh -c "systemsetup -setcomputername ${value} &> /dev/null"
  sudo sh -c "systemsetup -setlocalsubnetname ${value} &> /dev/null"

  sudo sh -c "defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName $value"
  sudo sh -c "defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server ServerDecription $value"

  diskutil renameVolume /Volumes/Macintosh\ HD "$(hostname)" &>/dev/null
}

# Add a recovery message to the OS X Lock Screen
function osx_system_recovery_message {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;
  local message="$1"; shift 1;
  local kextdir='/System/Library/Extensions'
  local eficachedir='/System/Library/Caches/com.apple.corestorage/EFILoginLocalizations'

  if [[ "$enabled" == "true" && "$message" != "" ]]; then
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText -string "$message"
    sudo nvram good-samaritan-message="$message"
  else
    sudo sh -c "defaults delete /Library/Preferences/com.apple.loginwindow LoginwindowText 2> /dev/null"
    sudo sh -c "nvram -d good-samaritan-message 2> /dev/null"
  fi

  # The CoreStorage kext cache needs to be updated so the recovery message
  # is displayed on the FDE pre-boot screen.
  #
  # The CS cache can be updated directly by touching $eficachedir, if it exists.
  # Otherwise you will need to touch $kextdir to generate it.
  
  # Refresh system kext cache
  sudo mkdir -p $kextdir 2> /dev/null

  # Refresh CoreStorage EFI Cache
  sudo mkdir -p $eficachedir 2> /dev/null

  sudo touch $eficachedir
}

# Toggles Whether to Restart Automatically if System Hangs
function osx_system_restart_on_hang {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on"; else enabled="off"; fi; shift 1;

  sudo systemsetup -setrestartfreeze ${enabled}
}

# Sets the number of recent items for various things like servers, documents and applications
function osx_system_max_number_of_recent_items {
  local max="$1"; shift 1;

  defaults write com.apple.recentitems Servers.MaxAmount -int $max
  defaults write com.apple.recentitems Documents.MaxAmount -int $max
  defaults write com.apple.recentitems Applications.MaxAmount -int $max
}
