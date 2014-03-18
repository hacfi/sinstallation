################################################################################
#                                 Printing      
################################################################################

# Toggle Whether the Print Dialog Should Disappear When All Jobs Are Complete
function osx_printing_quit_when_finished {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi

  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool $enabled
}
