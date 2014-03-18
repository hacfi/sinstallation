function install_group {
  local group_name="$1"; shift 1;

  source "./groups/${group_name}.sh"
}
