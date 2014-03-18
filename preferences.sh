path_to_plistbuddy="/usr/libexec/PlistBuddy"

function osx_preferences_synchronize {
/System/Library/Frameworks/Python.framework/Versions/Current/bin/python2 - <<END
from Foundation import CFPreferencesAppSynchronize
CFPreferencesAppSynchronize('$1')
END
}

function osx_preferences_apply {
  echo "Resetting Apps For Preferences to Take Effect"

  for app in 'Activity Monitor'\
             'Calendar'\
             'Contacts'\
             'cfprefsd'\
             'Dock'\
             'Finder'\
             'Mail'\
             'Messages'\
             'Safari'\
             'SizeUp'\
             'SystemUIServer'\
             'Transmission'\
             'Twitter'; do

    sudo killall "${app}" > /dev/null 2>&1
  done

  sudo touch /System/Library/Extensions
  sudo killall -HUP mDNSResponder

  dscacheutil -flushcache

  sudo find / -xdev -name '.DS_Store' -exec rm -f {} \;

  # Give the system time to commit changes from cache.
  for (( i = 0; i < 20; i++ )); do
    echo -n "##"; sleep 1;
    echo -n "##"; sleep 2;
  done

  echo ""
  echo "Some Changes Require a Restart to Take Effect"
}

source './preferences/activity_monitor.sh'
source './preferences/airdrop.sh'
source './preferences/airport.sh'
source './preferences/appearance.sh'
source './preferences/bluetooth.sh'
source './preferences/dashboard.sh'
source './preferences/debug.sh'
source './preferences/desktop.sh'
source './preferences/dialog.sh'
source './preferences/disk_images.sh'
source './preferences/disk_utility.sh'
source './preferences/displays.sh'
source './preferences/dock.sh'
source './preferences/drives.sh'
source './preferences/energy.sh'
source './preferences/file_vault.sh'
source './preferences/finder.sh'
source './preferences/firewall.sh'
source './preferences/firewire.sh'
source './preferences/gatekeeper.sh'
source './preferences/hot_corners.sh'
source './preferences/infrared_receiver.sh'
source './preferences/itunes.sh'
source './preferences/keyboard.sh'
source './preferences/launchpad.sh'
source './preferences/locale.sh'
source './preferences/location.sh'
source './preferences/login.sh'
source './preferences/menu_bar.sh'
source './preferences/mission_control.sh'
source './preferences/mouse.sh'
source './preferences/network.sh'
source './preferences/printing.sh'
source './preferences/quicklook.sh'
source './preferences/screen_capture.sh'
source './preferences/screen_sharing.sh'
source './preferences/screensaver.sh'
source './preferences/scrolling.sh'
source './preferences/security.sh'
source './preferences/sound.sh'
source './preferences/spaces.sh'
source './preferences/spotlight.sh'
source './preferences/system.sh'
source './preferences/time_machine.sh'
source './preferences/tooltips.sh'
source './preferences/trash.sh'
source './preferences/universal_access.sh'
source './preferences/windows.sh'
