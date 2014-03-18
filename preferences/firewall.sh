################################################################################
#                                  Firewall 
################################################################################

path_to_firewall_binary="/usr/libexec/ApplicationFirewall/socketfilterfw"

# Toggle Whether the Firewall is Enabled
function osx_firewall {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on"; else enabled="off"; fi

  sudo sh -c "$path_to_firewall_binary --setglobalstate $enabled &> /dev/null"
}

# Toggles Whether Signed Apps are Automatically Allowed to Accept Incoming Connections
function osx_firewall_auto_allow_signed_applications {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on"; else enabled="off"; fi

  sudo sh -c "$path_to_firewall_binary --setallowsigned ${enabled} &> /dev/null"
}

# Toggle Whether the Firewall Blocks All Non-Essential Incoming Connections
function osx_firewall_block_all_incoming_connections {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on"; else enabled="off"; fi

  sudo sh -c "$path_to_firewall_binary --setblockall ${enabled} &> /dev/null"
}

# Toggle Firewall Logging Mode
function osx_firewall_logging_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on"; else enabled="off"; fi

  sudo sh -c "$path_to_firewall_binary --setloggingmode ${enabled} &> /dev/null"
}

# Toggles Whether the Firewall Responds to Innocuous Requests like PING
function osx_firewall_stealth_mode {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="on"; else enabled="off"; fi

  sudo sh -c "$path_to_firewall_binary --setstealthmode ${enabled} &> /dev/null"
}
