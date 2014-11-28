function set_preferences {
  # Activity Monitor
  osx_activity_monitor_open_main_window                           enabled
  osx_activity_monitor_icon_mode                                  cpu_usage
  osx_activity_monitor_processes_to_list                          all_processes

  # Airdrop
  osx_airdrop_access_all_interfaces                               enabled

  # Airport
  osx_airport_disconnect_on_logout                                enabled
  osx_airport_join_mode                                           Preferred
  osx_airport_join_mode_fallback                                  DoNothing
  osx_airport_remember_recent_networks                            disabled
  osx_airport_require_password_for_computer_to_computer_networks  enabled

  # Appearance
  osx_appearance_font_rendering_mode                              2
  osx_appearance_font_smoothing_threshold                         8
  osx_appearance_sidebar_icons                                    small
  osx_appearance_transparency                                     disabled
  osx_appearance_dark_mode                                        enabled

  # Debugging
  osx_debug_mode                                                  enabled

  # Dialogs
  osx_dialogs_auto_expanding_print_dialog                         enabled
  osx_dialogs_auto_expanding_save_dialog                          enabled
  osx_dialogs_file_view_mode                                      list

  # Disk Images
  osx_disk_images_auto_mount                                      disabled
  osx_disk_images_verification                                    disabled

  # Disk Utility
  osx_disk_utility_advanced_image_options                         enabled
  osx_disk_utility_hidden_partitions                              enabled
  osx_disk_utility_unsupported_networks                           enabled

  # Dock
  osx_dock_hidden_app_dimming                                     enabled
  osx_dock_indicator_lights                                       disabled
  osx_dock_autohide                                               enabled  0.0 0.25
  osx_dock_icon_bounce_on_app_launch                              disabled
  osx_dock_icon_bounce_on_app_activity                            disabled
  osx_dock_full_screen_delay                                      disabled
  osx_dock_icon_size                                              40
  osx_dock_magnification                                          enabled 60

  osx_dock_clear

  # Drives
  osx_drives_autoplay_action                                      disabled

  # Energy
  osx_energy_disk_sleep                                           10    30
  osx_energy_display_sleep                                         5    15
  osx_energy_sleep                                                15     0
  osx_energy_power_nap                                            disabled disabled
  osx_energy_power_button_sleeps_system                           disabled

  # File Vault
  # file_vault                                                      enabled

  # Finder
  osx_finder_animations                                           disabled
  osx_finder_file_extensions_always_display                       enabled
  osx_finder_file_extensions_warn_on_change                       disabled
  osx_finder_path_bar                                             disabled
  osx_finder_posix_title_path                                     enabled
  osx_finder_status_bar                                           enabled
  osx_finder_date_format                                          absolute
  osx_finder_default_file_view_mode                               list
  osx_finder_default_location                                     home
  osx_finder_default_search_scope                                 current_folder
  osx_finder_icon_arrangement                                     grid
  osx_finder_springing                                            enabled 0.05
  osx_finder_info_pane_expansion                                  enabled
  osx_finder_icon_view_icon_size_and_spacing                      40 20 10

  # Firewall
  osx_firewall                                                    enabled
  osx_firewall_auto_allow_signed_applications                     disabled
  osx_firewall_block_all_incoming_connections                     disabled
  osx_firewall_logging_mode                                       enabled
  osx_firewall_stealth_mode                                       enabled

  # Gatekeeper
  osx_gatekeeper                                                  disabled

  # Hot Corners
  osx_hot_corners                                                 bottom_left sleep_display 0

  # Infrared Receiver
  osx_ir_receiver                                                 disabled

  # Keyboard
  osx_keyboard_accented_press_and_hold                            disabled
  osx_keyboard_text_substitution                                  disabled
  osx_keyboard_default_to_alternate_function_keys                 enabled
  osx_keyboard_control_access                                     all_controls_including_dropdowns
  osx_keyboard_auto_dim                                           enabled 300
  osx_keyboard_key_repeat_delay                                   15
  osx_keyboard_key_repeat_rate                                    2

  # Launchpad
  osx_launchpad_reset

  # Locale
  osx_locale_datetime                                             'America/Chicago'
  osx_locale_language                                             en_US
  osx_locale_measurement_unit                                     english
  osx_locale_international_date_format_strings

  # Login
  osx_login_auto_login_user                                       disabled
  osx_login_fast_user_switching                                   disabled
  # osx_login_guest                                                 disabled
  osx_login_power_options                                         disabled
  osx_login_admin_information                                     enabled
  osx_login_retries_before_hint                                   0
  osx_login_style                                                 name_and_password
  osx_login_show_secure_users                                     disabled

  # Menu Bar
  osx_menu_bar_date                                               "E d  H:mm"
  osx_menu_bar_invert_in_full_screen_mode                         enabled

  for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
      "/System/Library/CoreServices/Menu Extras/Volume.menu" \
      "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
      "/System/Library/CoreServices/Menu Extras/User.menu"
  done

  defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu"

  # Mission Control
  osx_mission_control_dashboard_visibility                        disabled
  osx_mission_control_group_by_app                                disabled
  osx_mission_control_animation                                   0.1

  # Mouse / Trackpad / Touchpad
  osx_trackpad_tap_to_click                                       enabled
  osx_trackpad_secondary_click                                    enabled
  osx_trackpad_three_finger_tap                                   disabled
  osx_mouse_one_finger_double_tap                                 smart_zoom
  osx_trackpad_two_finger_double_tap                              smart_zoom
  osx_trackpad_two_finger_horizontal_swipe                        horizontal_scroll
  osx_trackpad_three_finger_horizontal_swipe                      switch_pages
  osx_trackpad_four_finger_horizontal_swipe                       switch_apps
  osx_trackpad_three_finger_vertical_swipe                        disabled
  osx_trackpad_four_finger_vertical_swipe                         mission_control
  osx_trackpad_four_finger_vertical_swipe                         expose
  osx_trackpad_three_finger_drag                                  disabled
  osx_trackpad_two_finger_pinch                                   enabled
  osx_trackpad_four_finger_pinch                                  desktop
  osx_trackpad_five_finger_pinch                                  desktop
  osx_trackpad_swipe_from_right_edge                              notification_center
  osx_trackpad_rotation                                           enabled
  osx_trackpad_tap_to_drag                                        disabled

  osx_mouse_movement                                              1.5 0.6875
  osx_trackpad_movement                                           1.5 1.0

  # Network
  osx_network_dsstores                                            disabled
  osx_network_guest                                               disabled
  osx_network_default_login_name                                  "$(whoami)"
  osx_network_wake_on_ethernet                                    disabled
  osx_network_faxes                                               disabled
  osx_network_stop_bonjour_advertisements

  # Notification Center
  osx_notification_center_banner_delay                            2

  # Printing
  osx_printing_quit_when_finished                                 enabled

  # Quicklook
  osx_quicklook_text_selection                                    enabled
  osx_quicklook_xray_folders                                      enabled
  osx_quicklook_hide_on_deactivation                              disabled

  # Screen Capture
  osx_screen_capture                                              png "$HOME/Pictures" disabled "screenshot"

  # Screen Sharing
  osx_screen_sharing_unencrypted_connection_warnings              enabled

  # Screensaver
  osx_screensaver_password_protection                             enabled 15

  # Scrolling
  osx_scrolling_move_content                                      enabled
  osx_scrolling_autoscroll_delay                                  0.1

  # Security
  osx_security_system_preference_lock                             enabled
  osx_security_auditing                                           enabled
  osx_security_destroy_filevault_key_in_standby_mode              enabled
  osx_security_send_safari_search_suggestions_to_apple            disabled

  # Sound
  osx_sound_startup_chime                                         disabled
  osx_sound_volume_feedback                                       disabled
  osx_sound_bluetooth_optimum
  osx_sound_ui                                                    disabled 0.5
  osx_sound_speech_recognition                                    disabled
  osx_sound_text_to_speech                                        disabled
  osx_sound_voiceover                                             disabled

  # Spaces
  osx_spaces_sort_by_most_recently_used                           disabled
  osx_spaces_animation                                            enabled
  osx_spaces_switch_on_app_activation                             enabled
  osx_spaces_displays_have_separate_spaces                        enabled

  # System
  osx_system_update_automatic_downloads                           disabled
  osx_system_update_local_cdn                                     disabled
  osx_system_app_quarantine                                       disabled
  osx_system_automatic_app_termination                            disabled
  osx_system_crash_reporter                                       disabled server
  osx_system_save_documents_to_icloud_by_default                  disabled
  osx_system_save_windows_on_quit                                 disabled
  osx_system_update_schedule                                      daily
  osx_system_restart_on_hang                                      enabled
  osx_system_max_number_of_recent_items                           0
  osx_system_recovery_message                                     enabled "If you find this Mac, please call 615-663-9532. There is a reward."

  # Time Machine
  osx_time_machine_ask_to_use_new_disks_for_backup                disabled
  osx_time_machine_unsupported_network_volumes                    enabled
  osx_time_machine_local_backups                                  disabled
  osx_time_machine_add_exclusion                                  "$HOME/Boxes"
  osx_time_machine_add_exclusion                                  "$HOME/Downloads/skip-backup"
  osx_time_machine_backup_interval                                7200

  # Trash
  osx_trash_warn_when_emptying                                    disabled
  osx_trash_securely_empty_trash                                  enabled

  # Universal Access
  osx_universal_access_flash_screen                               enabled
  osx_universal_access_assistive_device_access                    enabled

  # Windows
  osx_windows_miniaturize_on_double_click                         enabled
  osx_windows_animations                                          enabled 0.01

  osx_preferences_apply
}
