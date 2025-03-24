{
  home.file.".bash_profile".text = ''
    if [ -z $WAYLAND_DISPLAY ] && [ $XDG_VTNR -eq 1 ]; then
      dbus-run-session Hyprland > /dev/null 2>&1
    fi
  '';
}
