################################################################################
#                                   Spotlight
################################################################################

function osx_spotlight {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on"; else enabled="off"; fi
  local loaded; if [[ "$1" == "enabled" ]]; then loaded="load"; else loaded="unload"; fi
  shift 1;

  if [[ "$enabled" == "off" ]]; then
    sudo sh -c "mdutil -a -E -i $enabled &> /dev/null"
    sudo sh -c "mdutil -a -d -E &> /dev/null"
    sudo sh -c "rm -rf /.Spotlight-V100 2> /dev/null"
    sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist 2> /dev/null"
    sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.index.plist 2> /dev/null"
    sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.scan.plist 2> /dev/null"
    sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.spindump.plist 2> /dev/null"
    sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
  else
    sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
    sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.index.plist
    sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.scan.plist
    sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.spindump.plist
    sudo mdutil -a -i $enabled
    sudo mdutil -a -E
    sudo chmod 777 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
  fi
}
