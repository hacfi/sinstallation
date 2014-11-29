rm -rf $HOME/Downloads/*.dmg
rm -rf $HOME/Downloads/*.zip
rm -rf $HOME/Downloads/*.pkg
rm -rf $HOME/Downloads/*.tbz
rm -rf $HOME/Downloads/*.cdr
rm -rf $HOME/.subversion
rm -rf $HOME/.gem
rm -rf $HOME/.cache
rm -rf $HOME/.pip
rm -rf $HOME/.distlib

echo ""
echo "Manual Steps:"
echo "  * Set your profile photo"
echo "  * Switch Caps Lock to Control"
echo "  * Setup Time Machine"
echo "  * Copy over Little Snitch base rules"
echo "  * Allow Undercover under Security & Privacy Accessibility pane"
echo "  * From Time Machine Backup"
echo "      * Copy over application preferences"
echo "      * Copy over personal dotfiles"
echo "      * Copy over keychain (optional)"
echo "      * Copy over licenses (optional)"
echo "  * Setup Google Accounts in System Preferences"
echo "      * Setup Calendar"
echo "      * Setup Contacts"
echo "  * Set your firmware password:"
echo "      * Restart your computer"
echo "      * Hold down Option"
echo "      * Boot to the Recovery Disk"
echo "      * Click Tools in the menu bar"
echo "      * Open Firmware Utility"
echo "      * Set a passphrase that is typable but difficult to guess"
echo "      * Put the passphrase in 1Password"
echo "  * After restarting with your profile photo set, enable FileVault"
echo "      * Open Terminal"
echo "      * Type this: sudo fdesetup enable"
echo "      * Keep your FileVault key in 1Password"
echo "      * Don't shut down your computer till FileVault completes"
echo ""

cd "$HOME"
rm -rf "$HOME/sinstallation"
