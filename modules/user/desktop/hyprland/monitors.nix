{pkgs, ...}: let
  monitorScript = ''
    #!/bin/bash

    LAPTOP="eDP-1"
    EXTERNAL=$(hyprctl monitors -j | ${pkgs.jq}/bin/jq -r '.[].name' | grep -v "$LAPTOP" | head -n1)

    if [ -n "$EXTERNAL" ]; then
      hyprctl keyword monitor "$LAPTOP,disable"
      hyprctl keyword monitor "$EXTERNAL,preferred,auto,1"
    else
      hyprctl keyword monitor "$LAPTOP,preferred,auto,1"
    fi
  '';
in {
  home.file.".config/hypr/scripts/monitor_autoswitch.sh" = {
    text = monitorScript;
    executable = true;
  };
}
