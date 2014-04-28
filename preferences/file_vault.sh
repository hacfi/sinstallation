################################################################################
#                                  File Vault
################################################################################

function file_vault {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="enable"; else enabled="disable"; fi; shift 1;

  if [[ "$(sudo fdesetup status)" == "FileVault is Off." ]]; then
    echo "Enabling FileVault"
    sudo fdesetup $enabled
  fi
}
