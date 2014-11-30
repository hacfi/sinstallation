#!/bin/sh

echo '********************************************************************************'
echo '                                  WARNING!'
echo '********************************************************************************'
echo ''
echo 'There is a bug in the way that Finder parses its configuration file.  In order'
echo 'for the preferences to take effect properly, you MUST do the following:'
echo ''
echo '  * Open Finder'
echo '  * Press Command-J (This will open the view options pane)'
echo '  * Click on EACH of the view styles (icon, list, etc) in turn'
echo '  * For EACH ONE, click "Use as Defaults" in the view options pane'
echo '  * If the view style does not have that button, just change the style in'
echo '    some way (icon size, font size, etc)'
echo '  * Open "Preview"'
echo '  * Press Command-O to get to the open dialog'
echo '  * Similar to before, click on each of the view styles in the dialog'
echo '  * Close "Preview"'
echo ''
echo 'You should now be good to go to run sinstallation!'
echo ''
echo 'Press RETURN to continue'
read

source "./bootstrap.sh"

install_profile kompanee
install_profile `whoami`

secure

source "./post_install.sh"
