function set_preferences {
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
  osx_dock_orientation                                                      right middle

  # Drives
  osx_drives_sudden_motion_sensor                                           disabled
  osx_drives_remote_sharing                                                 disabled

  # iTunes
  osx_itunes_automatic_device_backup_when_syncing                           disabled
  osx_itunes_automatic_sync                                                 disabled
  osx_itunes_media_key_access                                               disabled

  # Mouse
  osx_scrolling_move_content                                                disabled

  # Security
  osx_system_recovery_message                                               enabled "If you find this Mac, please call (561) 762-6969. There is a reward."

  # System
  osx_system_host_name                                                      ares

  # Tooltips
  osx_tooltips_delay                                                        250

  osx_preferences_apply
}
