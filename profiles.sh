function install_profile {
  local profile_name="$1"; shift 1;

  source "./profiles/${profile_name}.sh"
}
