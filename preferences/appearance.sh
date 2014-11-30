################################################################################
#                                Appearance
################################################################################

# TODO: Let the user pass in readable values instead of 1, 2, 3, etc.
#
# Mode 2 enables subpixel font rendering on non-Apple LCDs
#
# Change the Rendering Mode Used to Display Text
function osx_appearance_font_rendering_mode {
  local mode="$1"; shift 1;

  defaults write NSGlobalDomain AppleFontSmoothing -int $mode
}

# Turn off text smoothing for font sizes
function osx_appearance_font_smoothing_threshold {
  local threshold="$1"; shift 1;

  defaults write NSGlobalDomain AppleAntiAliasingThreshold -int $threshold
}

# TODO: Insert the rest of the colors listed in the General pref pane
#
# Set the Main UI Color
function osx_appearance_main_color {
  local color

  case $1 in
  blue)
    color="1";;
  graphite)
    color="6";;
  *)
    color="$1";;
  esac

  defaults write NSGlobalDomain AppleAquaColorVariant -int $color
}

function osx_appearance_highlight_color {
  local color

  # Highlight colors (from the crayons picker)
  case $1 in
  graphite)
    color="0.780400 0.815700 0.858800";;
  cayenne)
    color="0.501961 0.000000 0.000000";;
  asparagus)
    color="0.501961 0.501961 0.000000";;
  clover)
    color="0.000000 0.501961 0.000000";;
  teal)
    color="0.000000 0.501961 0.501961";;
  midnight)
    color="0.000000 0.000000 0.501961";;
  plum)
    color="0.501961 0.000000 0.501961";;
  tin)
    color="0.498039 0.498039 0.498039";;
  nickel)
    color="0.501961 0.501961 0.501961";;
  mocha)
    color="0.501961 0.250980 0.000000";;
  fern)
    color="0.250980 0.501961 0.000000";;
  moss)
    color="0.000000 0.501961 0.250980";;
  ocean)
    color="0.000000 0.250980 0.501961";;
  eggplant)
    color="0.250980 0.000000 0.501961";;
  maroon)
    color="0.501961 0.000000 0.250980";;
  steel)
    color="0.400000 0.400000 0.400000";;
  aluminum)
    color="0.600000 0.600000 0.600000";;
  maraschino)
    color="1.000000 0.000000 0.000000";;
  lemon)
    color="1.000000 1.000000 0.000000";;
  spring)
    color="0.000000 1.000000 0.000000";;
  turquoise)
    color="0.000000 1.000000 1.000000";;
  blueberry)
    color="0.000000 0.000000 1.000000";;
  magenta)
    color="1.000000 0.000000 1.000000";;
  iron)
    color="0.298039 0.298039 0.298039";;
  magnesium)
    color="0.701961 0.701961 0.701961";;
  tangerine)
    color="1.000000 0.501961 0.000000";;
  lime)
    color="0.501961 1.000000 0.000000";;
  seafoam)
    color="0.000000 1.000000 0.501961";;
  aqua)
    color="0.000000 0.501961 1.000000";;
  grape)
    color="0.501961 0.000000 1.000000";;
  strawberry)
    color="1.000000 0.000000 0.501961";;
  tungsten)
    color="0.200000 0.200000 0.200000";;
  silver)
    color="0.800000 0.800000 0.800000";;
  salmon)
    color="1.000000 0.400000 0.400000";;
  banana)
    color="1.000000 1.000000 0.400000";;
  flora)
    color="0.400000 1.000000 0.400000";;
  ice)
    color="0.400000 1.000000 1.000000";;
  orchid)
    color="0.400000 0.400000 1.000000";;
  bubblegum)
    color="1.000000 0.400000 1.000000";;
  lead)
    color="0.0980392 0.0980392 0.0980392";;
  mercery)
    color="0.901961 0.901961 0.901961";;
  cantaloupe)
    color="1.000000 0.800000 0.400000";;
  honeydew)
    color="0.800000 1.000000 0.400000";;
  spindrift)
    color="0.400000 1.000000 0.800000";;
  sky)
    color="0.400000 0.800000 1.000000";;
  lavender)
    color="0.800000 0.400000 1.000000";;
  carnation)
    color="1.000000 0.435294 0.811765";;
  licorice)
    color="0.000000 0.000000 0.000000";;
  snow)
    color="1.000000 1.000000 1.000000";;
  *)
    color="$1";;
  esac

  defaults write NSGlobalDomain AppleHighlightColor -string "$color"
  defaults write com.apple.systempreferences AppleOtherHighlightColor -string "$color"
}

# Set the Size of the Icons in the Sidebar
function osx_appearance_sidebar_icons {
  local size

  case $1 in
  small)
    size="1";;
  medium)
    size="2";;
  large)
    size="3";;
  esac

  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int $size
  defaults write NSGlobalDomain NSNavPanelIconViewIconSizeForOpenMode -int $size
}

function osx_appearance_transparency {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  defaults write com.apple.universalaccess reduceTransparency -bool $enabled
}

function osx_appearance_dark_mode {
  local mode;    if [[ "$1" == "enabled" ]]; then mode="Dark";    else mode="Light"; fi;
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="true"; else enabled="false"; fi;
  shift 1;

  defaults write NSGlobalDomain AppleInterfaceStyle $mode
  defaults write NSGlobalDomain NSFullScreenDarkMenu -bool $enabled
}
