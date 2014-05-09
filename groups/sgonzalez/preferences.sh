function set_preferences {
  # Dashboard
  osx_dashboard                                                             disabled

  # Appearance
  osx_appearance_main_color                                                 graphite
  osx_appearance_highlight_color                                            graphite

  # Desktop
  osx_desktop_displayed_item                        internal_hard_drives    disabled
  osx_desktop_displayed_item                        external_hard_drives    enabled
  osx_desktop_displayed_item                        mounted_servers         enabled
  osx_desktop_displayed_item                        removable_media         enabled
  osx_desktop_icon_size                                                     40 20

  # Dock
  osx_dock_itunes_notifications                                             disabled
  osx_dock_only_show_running_apps                                           enabled
  osx_dock_glassy                                                           disabled

  # Firewire
  osx_firewire                                                              disabled

  # iTunes
  osx_itunes_automatic_device_backup_when_syncing                           disabled
  osx_itunes_automatic_sync                                                 disabled
  osx_itunes_media_key_access                                               disabled

  # Locale
  osx_locale_datetime                                                       'America/Chicago'

  # System
  osx_system_host_name                                                      ebeneezer

  # Universal Access
  osx_universal_access_scrollwheel_zoom                                     disabled

  osx_preferences_apply
}
