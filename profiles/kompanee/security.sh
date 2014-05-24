################################################################################
#                                  Security
################################################################################

function secure {
  disable_unnecessary_services
  disable_guid_bits
  fix_applications_permissions
  fix_home_directory_permissions
}

function disable_unnecessary_services {
  sudo sh -c "launchctl unload -w /System/Library/LaunchDaemons/com.apple.nis.ypbind.plist 2> /dev/null"
  sudo sh -c "launchctl unload -w /System/Library/LaunchDaemons/com.apple.RemoteDesktop.PrivilegeProxy.plist 2> /dev/null"
  sudo sh -c "launchctl unload -w /System/Library/LaunchDaemons/com.apple.RFBEventHelper.plist 2> /dev/null"
  sudo sh -c "launchctl unload -w /System/Library/LaunchDaemons/com.apple.webdavfs_load_kext.plist 2> /dev/null"
  sudo sh -c "launchctl unload -w /System/Library/LaunchDaemons/org.postfix.master 2> /dev/null"

  sudo sh -c "launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteUI.plist 2> /dev/null"
  sudo sh -c "launchctl unload -w /System/Library/LaunchAgents/com.apple.RemoteDesktop.plist 2> /dev/null"
}

function disable_guid_bits {
  sudo sh -c "chmod ug-s /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/MacOS/ARDAgent 2> /dev/null"
  sudo sh -c "chmod ug-s /System/Library/Printers/IOMs/LPRIOM.plugin/Contents/MacOS/LPRIOMHelper 2> /dev/null"
  sudo sh -c "chmod ug-s /sbin/mount_nfs 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/at 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/atq 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/atrm 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/chpass 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/crontab 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/ipcs 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/newgrp 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/postdrop 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/postqueue 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/procmail 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/wall 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/write 2> /dev/null"
  sudo sh -c "chmod ug-s /bin/rcp 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/rlogin 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/bin/rsh 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/lib/sa/sadc 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/sbin/scselect 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/sbin/traceroute 2> /dev/null"
  sudo sh -c "chmod ug-s /usr/sbin/traceroute6 2> /dev/null"
}

function fix_home_directory_permissions {
  sudo chmod -R go-rx $HOME
}

function fix_applications_permissions {
  sudo chown -R root:wheel /Applications
}
