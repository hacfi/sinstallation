################################################################################
#                                Gatekeeper       
################################################################################

# Toggles Whether to Restart Automatically if System Hangs
function osx_gatekeeper {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="enable"; else enabled="disable"; fi; shift 1;

  sudo spctl --master-${enabled}
}
