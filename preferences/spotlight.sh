################################################################################
#                                   Spotlight
################################################################################

function osx_spotlight {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on";  else enabled="off";   fi
  local loaded;  if [[ "$1" == "enabled" ]]; then loaded="load"; else loaded="unload"; fi
  shift 1;

  # Change indexing order and disable some search results
  defaults write com.apple.spotlight orderedItems -array \
    '{"enabled" = 0;"name" = "APPLICATIONS";}' \
    '{"enabled" = 0;"name" = "SYSTEM_PREFS";}' \
    '{"enabled" = 0;"name" = "DIRECTORIES";}' \
    '{"enabled" = 0;"name" = "PDF";}' \
    '{"enabled" = 0;"name" = "FONTS";}' \
    '{"enabled" = 0;"name" = "DOCUMENTS";}' \
    '{"enabled" = 0;"name" = "MESSAGES";}' \
    '{"enabled" = 0;"name" = "CONTACT";}' \
    '{"enabled" = 0;"name" = "EVENT_TODO";}' \
    '{"enabled" = 0;"name" = "IMAGES";}' \
    '{"enabled" = 0;"name" = "BOOKMARKS";}' \
    '{"enabled" = 0;"name" = "MUSIC";}' \
    '{"enabled" = 0;"name" = "MOVIES";}' \
    '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
    '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
    '{"enabled" = 0;"name" = "SOURCE";}' \
    '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
    '{"enabled" = 0;"name" = "MENU_OTHER";}' \
    '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
    '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
    '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
    '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

  sudo killall mds > /dev/null 2>&1

  if [[ "$enabled" == "off" || "$enabled" == "unload" ]]; then
    sudo sh -c "mdutil -a -E -i $enabled &> /dev/null"
    sudo sh -c "mdutil -a -d -E &> /dev/null"
    sudo sh -c "rm -rf /.Spotlight-V100 2> /dev/null"
    sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
  else
    sudo mdutil -a -i $enabled
    sudo mdutil -a -E
    sudo chmod 777 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
  fi

  ###
  # Completely unloading Spotlight is almost never what you want
  #
  # if [[ "$enabled" == "unload" ]]; then
  #   sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist 2> /dev/null"
  #   sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.index.plist 2> /dev/null"
  #   sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.scan.plist 2> /dev/null"
  #   sudo sh -c "launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.spindump.plist 2> /dev/null"
  # else
  #   sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
  #   sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.index.plist
  #   sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.scan.plist
  #   sudo launchctl $loaded -w /System/Library/LaunchDaemons/com.apple.metadata.mds.spindump.plist
  # fi
}
