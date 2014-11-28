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

  # Dock
  osx_dock_itunes_notifications                                             disabled
  osx_dock_only_show_running_apps                                           enabled

  # iTunes
  osx_itunes_automatic_device_backup_when_syncing                           disabled
  osx_itunes_automatic_sync                                                 disabled
  osx_itunes_media_key_access                                               disabled

  # Keyboard
  osx_keyboard_default_to_alternate_function_keys                           disabled

  # Security
  osx_system_recovery_message                                               enabled "If you find this Mac, please call 512-739-9268. There is a reward."

  # System
  osx_system_host_name                                                      ebeneezer

  # Universal Access
  osx_universal_access_scrollwheel_zoom                                     disabled

  osx_preferences_apply
}
