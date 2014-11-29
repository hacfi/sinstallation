################################################################################
#                                  Keyboard
################################################################################

# Press-and-Hold for Accented Characters
function osx_keyboard_accented_press_and_hold {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool $enabled
}

# Toggle Spell-Checking
function osx_keyboard_spell_checking {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain WebContinuousSpellCheckingEnabled -bool $enabled
  defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool $enabled
}

function osx_keyboard_text_substitution {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool $enabled
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool $enabled
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool $enabled
  defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool $enabled
  defaults write NSGlobalDomain WebAutomaticDashSubstitutionEnabled -bool $enabled
  defaults write NSGlobalDomain WebAutomaticTextReplacementEnabled -bool $enabled
  defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool $enabled
}

# Default to "Alernate" Function Keys When Not Holding the "fn" Key
function osx_keyboard_default_to_alternate_function_keys {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi; shift 1;

  defaults write NSGlobalDomain com.apple.keyboard.fnState -bool $enabled
}

# Set Keyboard Access for Controls
function osx_keyboard_control_access {
  local mode

  case "$1" in
  all_controls_including_dropdowns)
    mode="3";;
  all_controls)
    mode="2";;
  basic)
    mode="1";;
  esac

  defaults write NSGlobalDomain AppleKeyboardUIMode -int $mode
}

function osx_keyboard_auto_dim {
  local auto_dim; if [[ "$1" == "enabled" ]]; then auto_dim="true"; else auto_dim="false"; fi; shift 1;
  local auto_dim_delay="$1"; shift 1;

  # Toggle Keyboard Illumination Brightness Changes Depending on Ambient Light
  defaults write com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool $auto_dim

  # Set Idle Time Before Keyboard Illumination Turns Off
  defaults write com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int $auto_dim_delay
}

# Sets the delay before held keys repeat.
#
# delay - ms before key starts repeating. Defaults to 35.
function osx_keyboard_key_repeat_delay {
  local delay="$1"; shift 1;

  defaults write NSGlobalDomain InitialKeyRepeat -int $delay
}

# Sets the repeat rate for held keys.
#
# rate - the delay between key 'presses'. Defaults to 0.
function osx_keyboard_key_repeat_rate {
  local rate="$1"; shift 1;

  defaults write NSGlobalDomain KeyRepeat -int $rate
}
