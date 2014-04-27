source './homebrew.sh'
source './apps/installers.sh'

function install_adium {
  install_disk_image_app "http://download.adium.im/Adium_1.5.9.dmg" "Adium.app"
}

function install_airserver {
  install_disk_image_app "http://dl.airserver.com/mac/AirServer-5.0.4.0.dmg" "AirServer.app"
}

function install_araxis_merge {
  install_disk_image_app "http://www.araxis.com/download/Merge2013.4415-OSX10.9.dmg" "Araxis Merge.app"
}

function install_dash {
  install_mac_app_store_app "Dash.app"
}

function install_evernote {
  install_disk_image_app "http://cdn1.evernote.com/mac/release/Evernote_402372.dmg" "Evernote.app"
}

function install_firefox {
  if [[ "$1" == "nightly" ]]; then
    local url="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/firefox-30.0a1.en-US.mac.dmg"
    local app_name="FirefoxNightly.app"
  else
    local url="http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/27.0/mac/en-US/Firefox%2027.0.dmg"
    local app_name="Firefox.app"
  fi

  install_disk_image_app "$url" "$app_name"
}

function install_flux {
  install_compressed_app "https://justgetflux.com/mac/fluxbeta.zip" "Flux.app"
}

function install_git {
  install_or_upgrade_package git
}

function install_gitx {
  install_compressed_app "http://cloud.github.com/downloads/rowanj/gitx/GitX-dev-57.zip" "GitX.app"
}

function install_google_chrome {
  if [[ "$1" == "canary" ]]; then
    local url="https://storage.googleapis.com/chrome-canary/GoogleChromeCanary.dmg"
    local app_name="Google Chrome Canary.app"
  else
    local url="https://dl.google.com/chrome/mac/stable/GoogleChrome.dmg"
    local app_name="Google Chrome.app"
  fi

  install_disk_image_app "$url" "$app_name"
}

function install_gpg {
  install_disk_image_packaged_app "https://releases.gpgtools.org/GPG%20Suite%20-%202013.10.22.dmg" "GPG Keychain Access.app" "Install.pkg"
}

function install_handbrake {
  install_disk_image_app "http://softlayer-ams.dl.sourceforge.net/project/handbrake/0.9.9/HandBrake-0.9.9-MacOSX.6_GUI_x86_64.dmg" "HandBrake.app"
}

function install_iterm {
  install_compressed_app "http://www.iterm2.com/downloads/beta/iTerm2-1_0_0_20140112.zip" "iTerm.app"
}

function install_kindle {
  install_mac_app_store_app "Kindle.app"
}

function install_launchbar {
  install_disk_image_app "http://www.obdev.at/downloads/launchbar/LaunchBar-5.6.2.dmg" "LaunchBar.app"
}

function install_little_snitch {
  install_disk_image_with_installer "http://www.obdev.at/downloads/LittleSnitch/nightly/LittleSnitch-3.3.1-nightly-(4080).dmg" "Little Snitch Configuration.app" "Little Snitch Installer.app/Contents/MacOS/Little Snitch Installer"
}

function install_macpar {
  install_disk_image_app "http://www.xs4all.nl/~gp/MacPAR_deLuxe/MacPARdeLuxe.dmg" "MacPAR deLuxe.app"
}

function install_macvim {
  install_compressed_app "https://github.com/b4winckler/macvim/releases/download/snapshot-72/MacVim-snapshot-72-Mavericks.tbz" "MacVim.app"
}

function install_mplayerx {
  install_compressed_app "http://mplayerx.googlecode.com/files/MPlayerX-1.0.21.zip" "MPlayerX.app"
}

function install_name_mangler {
  install_disk_image_app "http://manytricks.com/download/namemangler" "Name Mangler.app"
}

function install_one_password {
  install_compressed_app "https://d13itkw33a7sus.cloudfront.net/dist/1P/mac4/1Password-4.0.9.zip" "1Password 4.app"
}

function install_pocket {
  install_mac_app_store_app "Pocket.app"
}

function install_rdio {
  install_disk_image_app "http://www.rdio.com/media/static/desktop/mac/Rdio.dmg" "Rdio.app"
}

function install_reeder {
  install_mac_app_store_app "Reeder.app"
}

function install_scansnap {
  install_disk_image_packaged_app "http://www.fujitsu.com/downloads/IMAGE/driver/ss/mgr/m-s1300i/ScanSnap.dmg" "ScanSnap" "ScanSnap Manager.pkg"
}

function install_screenflow {
  install_disk_image_app "http://www.telestream.net/download-files/screenflow/4-5/ScreenFlow-4.5.dmg" "ScreenFlow.app"
}

function install_shush {
  install_mac_app_store_app "Shush.app"
}

function install_sizeup {
  install_compressed_app "http://www.irradiatedsoftware.com/download/SizeUp.zip" "SizeUp.app"
}

function install_sparrow {
  install_disk_image_app "http://download.sparrowmailapp.com/appcast/Sparrow-latest.dmg" "Sparrow.app"
}

function install_steam {
  install_disk_image_app "http://media.steampowered.com/client/installer/steam.dmg" "Steam.app"
}

function install_sublime_text {
  install_disk_image_app "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203059.dmg" "Sublime Text.app"
}

function install_teamviewer {
  install_disk_image_packaged_app "http://download.teamviewer.com/download/TeamViewer.dmg" "TeamViewer.app" "Install TeamViewer.pkg"
}

function install_thunderbird {
  install_disk_image_app "http://download-origin.cdn.mozilla.net/pub/mozilla.org/thunderbird/releases/24.3.0/mac/en-US/Thunderbird%2024.3.0.dmg" "Thunderbird.app"
}

function install_transmission {
  install_disk_image_app "http://download.transmissionbt.com/files/Transmission-2.82.dmg" "Transmission.app"
}

function install_transmit {
  install_compressed_app "http://www.panic.com/transmit/d/Transmit%204.4.5.zip" "Transmit.app"
}

function install_tweetbot {
  install_mac_app_store_app "Tweetbot.app"
}

function install_unarchiver {
  install_mac_app_store_app "The Unarchiver.app"
}

function install_undercover {
  install_package "http://assets.undercoverhq.com/client/5.6/undercover_mac.pkg" "Undercover.app" "Undercover.app.pkg" "/usr/local/uc/bin/uc.app"
}

function install_vagrant {
  install_disk_image_packaged_app "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.5.0.dmg" "Vagrant/bin/vagrant" "Vagrant.pkg"
}

function install_viscosity {
  install_disk_image_app "http://www.thesparklabs.com/downloads/Viscosity.dmg" "Viscosity.app"
}

function install_vmware {
  install_disk_image_app "https://s3.amazonaws.com/boxen-downloads/vmware/VMware-Fusion-6.0.2-1398658-light.dmg" "VMware Fusion.app"
}

function install_wunderlist {
  install_mac_app_store_app "Wunderlist.app"
}

function install_xtrafinder {
  install_disk_image_packaged_app "http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg" "XtraFinder.app" "XtraFinder.pkg"
}

function install_pagekite {
  local pagekite_local_binary='/usr/local/bin/pagekite.py'

  download_app 'https://pagekite.net/pk/pagekite.py' $pagekite_local_binary
  chmod 755 "$pagekite_local_binary"
  mkdir /usr/local/var/run
  sudo touch /var/log/pagekite.log
  sudo chown `whoami`:staff /var/log/pagekite.log

  "$pagekite_local_binary" --signup
}
