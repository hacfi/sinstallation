function set_preferences {
  # Airport
  osx_airport_require_password_to_change_networks                           enabled
  osx_airport_require_password_to_toggle_power                              enabled

  # Dashboard
  osx_dashboard                                                             disabled

  # Appearance
  osx_appearance_main_color                                                 graphite
  osx_appearance_highlight_color                                            graphite

  # Desktop
  osx_desktop_displayed_item                        internal_hard_drives    disabled
  osx_desktop_displayed_item                        external_hard_drives    enabled
  osx_desktop_displayed_item                        mounted_servers         disabled
  osx_desktop_displayed_item                        removable_media         enabled

  # Displays
  osx_displays_auto_brightness_adjustment                                   disabled

  # Dock
  osx_dock_itunes_notifications                                             disabled
  osx_dock_only_show_running_apps                                           enabled
  osx_dock_orientation                                                      left middle

  # Drives
  osx_drives_sudden_motion_sensor                                           disabled
  osx_drives_remote_sharing                                                 disabled

  # Energy
  osx_energy_app_nap                                                        disabled

  # Finder
  osx_finder_allow_quit                                                     enabled
  osx_finder_icon_previews                                                  disabled
  osx_finder_unhide_library

  # iTunes
  osx_itunes_automatic_device_backup_when_syncing                           disabled
  osx_itunes_automatic_sync                                                 disabled
  osx_itunes_media_key_access                                               disabled

  # Locale
  osx_locale_24_hour_clock                                                  enabled

  # Location
  osx_location                                                              disabled

  # Keyboard
  osx_keyboard_default_to_alternate_function_keys                           enabled

  # Spotlight
  osx_spotlight                                                             disabled

  # System
  osx_system_host_name                                                      poseidon
  osx_system_document_versioning                                            disabled
  osx_system_update_automatic_downloads                                     disabled
  osx_system_update_automatic_installation                                  disabled

  # Tooltips
  osx_tooltips_delay                                                        250

  # Universal Access
  osx_universal_access_scrollwheel_zoom                                     disabled

  osx_preferences_apply
}
