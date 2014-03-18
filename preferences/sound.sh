################################################################################
#                                   Sound  
################################################################################

# Toggle Startup Sound
function osx_sound_startup_chime {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  if [[ "$enabled" == "true" ]]; then
    sudo nvram -d SystemAudioVolume
  else
    sudo nvram SystemAudioVolume=%80
  fi
}

# Toggle Volume Feedback Sound
function osx_sound_volume_feedback {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="1"; else enabled="0"; fi

  defaults write NSGlobalDomain com.apple.sound.beep.feedback -int $enabled
}

# Set the Audio Bitpool for Bluetooth Audio Devices
function osx_sound_bluetooth_optimum {
  defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 35
  defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 53
  defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 35
}

# Toggle UI Sound Effects
function osx_sound_ui {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi
  local enabled_int; if [[ "$1" == "enabled" ]]; then enabled_int="1"; else enabled_int="0"; fi; shift 1;
  local value="$1"; shift 1;

  defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -int $enabled_int
  defaults write com.apple.finder FinderSounds -bool $enabled
  defaults write com.apple.systemsound com.apple.sound.beep.volume -float $value
}

# Toggle Speech Recognition
function osx_sound_speech_recognition {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  sudo defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs StartSpeakableItems -bool $enabled
}

# Toggle Text to Speech
function osx_sound_text_to_speech {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  sudo defaults write com.apple.speech.synthesis.general.prefs TalkingAlertsSpeakTextFlag -bool $enabled
  sudo defaults write com.apple.speech.synthesis.general.prefs SpokenNotificationAppActivationFlag -bool $enabled
  sudo defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyFlag -bool $enabled
  sudo sh -c "defaults delete com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs 2> /dev/null"
}

# Disable VoiceOver service.
function osx_sound_voiceover {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="load"; else enabled="unload"; fi

  sudo sh -c "launchctl $enabled -w /System/Library/LaunchAgents/com.apple.VoiceOver.plist 2> /dev/null"
  sudo sh -c "launchctl $enabled -w /System/Library/LaunchAgents/com.apple.ScreenReaderUIServer.plist 2> /dev/null"
  sudo sh -c "launchctl $enabled -w /System/Library/LaunchAgents/com.apple.scrod.plist 2> /dev/null"
}
