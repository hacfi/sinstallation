################################################################################
#                                 Screensaver
################################################################################

# Toggles Whether or not a Password is Required to Disable the Screensaver
function osx_screensaver_password_protection {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;
  local delay="$1"; shift 1;

  defaults -currentHost write com.apple.screensaver askForPassword -bool $enabled
  defaults -currentHost write com.apple.screensaver askForPasswordDelay -int $delay
}
