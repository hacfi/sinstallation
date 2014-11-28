function set_preferences {
  # Airport
  osx_airport_require_password_to_change_networks                           enabled
  osx_airport_require_password_to_toggle_power                              enabled

  # Dashboard
  osx_dashboard                                                             disabled

  # Appearance
  osx_appearance_main_color                                                 graphite
  osx_appearance_highlight_color                                            graphite

  # Dock
  osx_dock_itunes_notifications                                             disabled
  osx_dock_only_show_running_apps                                           enabled
  osx_dock_orientation                                                      right middle

  # Finder
  osx_finder_allow_quit                                                     enabled
  osx_finder_icon_previews                                                  disabled

  # iTunes
  osx_itunes_automatic_device_backup_when_syncing                           disabled
  osx_itunes_automatic_sync                                                 disabled
  osx_itunes_media_key_access                                               disabled

  # Locale
  osx_locale_datetime                                                       'America/Chicago'
  osx_locale_24_hour_clock                                                  enabled

  # Spotlight
  osx_spotlight                                                             disabled

  # System
  osx_system_host_name                                                      shermes
  osx_system_document_versioning                                            disabled

  # Tooltips
  osx_tooltips_delay                                                        250

  osx_preferences_apply
}
