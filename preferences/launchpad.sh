################################################################################
#                                  Launchpad
################################################################################

# Reset LaunchPad
function osx_launchpad_reset {
  find "/Users/$(whoami)/Library/Application Support/Dock" -name '*.db' -maxdepth 1 -delete
}
