################################################################################
#                                   Spotlight
################################################################################

source './keyboard_shortcuts.sh'

function osx_spotlight {
  local enabled;      if [[ "$1" == "enabled" ]]; then enabled="on";        else enabled="off";   fi
  local enabled_int;  if [[ "$1" == "enabled" ]]; then enabled_int="1";     else enabled_int="0";   fi
  local enabled_bool; if [[ "$1" == "enabled" ]]; then enabled_bool="true"; else enabled_bool="false"; fi
  local loaded;       if [[ "$1" == "enabled" ]]; then loaded="load";       else loaded="unload"; fi
  shift 1;

  sudo killall mds > /dev/null 2>&1

  sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

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

  # Change indexing order and disable some search results
  defaults write com.apple.Spotlight orderedItems -array \
    "{\"enabled\" = $enabled_int; \"name\" = \"APPLICATIONS\";}" \
    "{\"enabled\" = $enabled_int; \"name\" = \"SYSTEM_PREFS\";}" \
    "{\"enabled\" = $enabled_int; \"name\" = \"DIRECTORIES\";}" \
    "{\"enabled\" = $enabled_int; \"name\" = \"PDF\";}" \
    "{\"enabled\" = $enabled_int; \"name\" = \"FONTS\";}" \
    "{\"enabled\" = $enabled_int; \"name\" = \"DOCUMENTS\";}" \
    "{\"enabled\" = $enabled_int; \"name\" = \"MESSAGES\";}" \
    "{\"enabled\" = $enabled_int; \"name\" = \"CONTACT\";}" \
    "{\"enabled\" = 0;            \"name\" = \"EVENT_TODO\";}" \
    "{\"enabled\" = 0;            \"name\" = \"IMAGES\";}" \
    "{\"enabled\" = 0;            \"name\" = \"BOOKMARKS\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MUSIC\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MOVIES\";}" \
    "{\"enabled\" = 0;            \"name\" = \"PRESENTATIONS\";}" \
    "{\"enabled\" = 0;            \"name\" = \"SPREADSHEETS\";}" \
    "{\"enabled\" = 0;            \"name\" = \"SOURCE\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MENU_DEFINITION\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MENU_OTHER\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MENU_CONVERSION\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MENU_EXPRESSION\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MENU_WEBSEARCH\";}" \
    "{\"enabled\" = 0;            \"name\" = \"MENU_SPOTLIGHT_SUGGESTIONS\";}"

  local spotlight_keyboard_shortcut_ids=(64 65)

  for keyboard_shortcut_id in "${spotlight_keyboard_shortcut_ids[@]}"; do
    osx_keyboard_shortcut_toggle $keyboard_shortcut_id $enabled_bool
  done
}
