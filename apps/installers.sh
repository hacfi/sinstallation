function install_disk_image_app {
  local url="$1"; shift 1;
  local app_name="$1"; shift 1;
  local local_file="$HOME/Downloads/${app_name}.dmg";

  if ! [ -a "/Applications/$app_name" ]; then
    download_app "$url" "$local_file"

    mount_image "$local_file"

    install_app "$app_name" "/Volumes/image"

    unmount_image
  fi
}

function install_eula_disk_image_app {
  local url="$1"; shift 1;
  local app_name="$1"; shift 1;
  local base_name="$HOME/Downloads/${app_name}";
  local temp_file="${base_name}.dmg";
  local non_eula_file="${base_name}.cdr";

  if ! [ -a "/Applications/$app_name" ]; then
    download_app "$url" "$temp_file"

    remove_eula_from_image "$base_name"
    mount_image "$non_eula_file"

    install_app "$app_name" "/Volumes/image"

    unmount_image
  fi
}

function remove_eula_from_image {
  local base_name="$1"; shift 1;
  local image_file="${base_name}.dmg";

  /usr/bin/hdiutil convert -quiet "$image_file" -format UDTO -o "$base_name"
}

function install_compressed_app {
  local url="$1"; shift 1;
  local app_name="$1"; shift 1;
  local compressed_filename="$(basename $url)"
  local local_file="$HOME/Downloads/$compressed_filename"; shift 1;

  if ! [ -a "/Applications/$app_name" ]; then
    download_app "$url" "$local_file"

    uncompress_and_install "$app_name" "$local_file"
  fi
}

function install_disk_image_packaged_app {
  local url="$1"; shift 1;
  local app_name="$1"; shift 1;
  local package_name="$1"; shift 1;
  local local_file="$HOME/Downloads/${app_name}.dmg"; shift 1;

  if ! [ -a "/Applications/$app_name" ]; then
    download_app "$url" "$local_file"

    mount_image "$local_file"

    install_packaged_app "$package_name" "/Volumes/image"

    unmount_image
  fi
}

function install_package {
  local url="$1"; shift 1;
  local app_name="$1"; shift 1;
  local package_name="$1"; shift 1;
  local local_file="$HOME/Downloads/${app_name}.pkg";
  local installation_directory; if [ -n "$1" ]; then installation_directory="$1"; else installation_directory="/Applications/$app_name"; fi; shift 1;

  if ! [ -a "$installation_directory" ]; then
    download_app "$url" "$local_file"

    install_packaged_app "$package_name" "$HOME/Downloads"
  fi
}

function install_disk_image_with_installer {
  local url="$1"; shift 1;
  local app_name="$1"; shift 1;
  local path_to_installer="$1"; shift 1;
  local local_file="$HOME/Downloads/${app_name}.dmg"; shift 1;

  if ! [ -a "/Applications/$app_name" ]; then
    download_app "$url" "$local_file"

    mount_image "$local_file"

    install_app_with_installer "$path_to_installer" "/Volumes/image"

    unmount_image
  fi
}

function install_mac_app_store_app {
  local app_name="$1"; shift 1;

  if ! [ -a "/Applications/$app_name" ]; then
    echo "$app_name is in the Mac App Store"
    read -p "Press Return to continue..."
  fi
}

function uncompress_and_install {
  local app_name="$1"; shift 1;
  local compressed_file="$1"; shift 1;
  local extraction_dir="$HOME/Downloads/${app_name}"

  mkdir -p "$extraction_dir"

  extract "$compressed_file" "$extraction_dir"
  install_app "$app_name" "$extraction_dir/"

  rm -rf "$extraction_dir"
}

function install_app {
  local app_name="$1"; shift 1;
  local source_app_dir="$1"; shift 1;

  rm -rf "/Applications/$app_name"
  sudo find "$source_app_dir" -name "$app_name" -exec cp -R {} "/Applications/" \;
}

function download_app {
  local url="$1"; shift 1;
  local local_file="$1"; shift 1;

  if ! [ -a "$local_file" ]; then
    wget -O "$local_file" "$url"
  fi
}

function mount_image {
  local local_file="$1"; shift 1;

  hdiutil attach "$local_file" -mountpoint "/Volumes/image"
}

function unmount_image {
  hdiutil detach "/Volumes/image"
}

function install_packaged_app {
  local package_name="$1"; shift 1;
  local package_dir="$1"; shift 1;

  sudo /usr/sbin/installer -pkg "$package_dir/$package_name" -target /
}

function install_app_with_installer {
  local path_to_installer="$1"; shift 1;
  local root_path="$1"; shift 1;

  "${root_path}/${path_to_installer}"
}

function extract {
  local compressed_file="$1"; shift 1;
  local extraction_dir="$1"; shift 1;

  file_name="$( basename "$compressed_file" )"

  case "$file_name" in
    (*.tar.gz|*.tgz)          tar xzf "$compressed_file" -C "$extraction_dir" ;;
    (*.tar.bz2|*.tbz|*.tbz2)  tar xjf "$compressed_file" -C "$extraction_dir" ;;
    (*.tar)                   tar xf "$compressed_file" -C "$extraction_dir" ;;
    (*.zip)                   unzip -qq "$compressed_file" -d "$extraction_dir" ;;
  esac
}
