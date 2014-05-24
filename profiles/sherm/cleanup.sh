function cleanup {
  sudo rm -rf "/Applications/Dashboard.app"
  sudo rm -rf "/Applications/Launchpad.app"
  sudo rm -rf "/Applications/Mission Control.app"
  sudo rm -rf "/Applications/TextEdit.app"
  sudo rm -rf "/Applications/Utilities/Audio MIDI Setup.app"
  sudo rm -rf "/Applications/Utilities/Boot Camp Assistant.app"
  sudo rm -rf "/Applications/Utilities/DigitalColor Meter.app"
  sudo rm -rf "/Applications/Utilities/Grab.app"
  sudo rm -rf "/Applications/Utilities/Grapher.app"
  sudo rm -rf "/Applications/Utilities/Migration Assistant.app"

  sudo rm -rf $HOME/Public 2> /dev/null
  sudo rm -rf $HOME/Sites 2> /dev/null
}
