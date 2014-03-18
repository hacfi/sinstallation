function add_login_item {
  local item_path="$1"; shift 1;
  local hidden; if [[ "$1" == "hidden" ]]; then hidden="true"; else hidden="false"; fi; shift 1;

  osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"$item_path\", hidden:$hidden}" 2> /dev/null &> /dev/null
}
