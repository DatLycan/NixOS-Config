{pkgs, ...}: let
  monitorScript = ''
    #!/bin/sh

    LAPTOP="eDP-1"
    EXTERNAL=$(hyprctl monitors -j | ${pkgs.jq}/bin/jq -r '.[].name' | grep -v "$LAPTOP" | head -n1)

    sleep 5

    if [ -n "$EXTERNAL" ]; then
      hyprctl keyword monitor "$LAPTOP,disable"
      hyprctl keyword monitor "$EXTERNAL,preferred,auto,1"
    else
      hyprctl keyword monitor "$LAPTOP, 2880x1920@120, auto, 2"
    fi
  '';
in {
  home.file.".config/hypr/scripts/monitor_autoswitch.sh" = {
    text = monitorScript;
    executable = true;
  };
}
