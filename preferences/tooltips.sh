################################################################################
#                                  Tooltips 
################################################################################

function osx_tooltips_delay {
  local delay="$1"; shift 1;

  defaults write NSGlobalDomain NSInitialToolTipDelay -int $delay
}

function osx_tooltips_autowrap {
  local enabled; if [[ "$1" == "enabled" ]]; then enabled="false"; else enabled="true"; fi; shift 1;

  defaults write NSGlobalDomain NSToolTipAutoWrappingDisabled -bool $enabled
}

function osx_tooltips_font_size {
  local size="$1"; shift 1;

  defaults write NSGlobalDomain NSToolTipsFontSize -float $size
}

function osx_tooltips_font {
  local font_name="$1"; shift 1;

  defaults write NSGlobalDomain NSToolTipsFont -font $font_name
}
