################################################################################
#                                  Firewire
################################################################################

# Remove FireWire kernel extensions
function osx_firewire {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  if [[ "$enabled" == "false" ]]; then
    sudo rm -rf /System/Library/Extensions/IOFireWireSerialBusProtocolTransport.kext
  fi
}
