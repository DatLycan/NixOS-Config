{
  pkgs,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [
      hyprlock
    ];
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
      };

      label = {
        text = "$TIME";
        font_size = 96;
        font_family = "JetBrains Mono";
        position = "0, 51%";
        halign = "center";
      };

      background = lib.mkForce {
        path = "screenshot";
        blur_passes = 3;
        blur_size = 13;
      };

      input-field = lib.mkForce [
        {
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "#E5E9F0";
          inner_color = "#2E3440";
          outer_color = "#81A1C1";
          outline_thickness = 5;
          placeholder_text = "Password...";
          font_family = "JetBrains Mono";
        }
      ];
    };
  };
}
