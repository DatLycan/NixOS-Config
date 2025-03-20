{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      hyprlock
    ];
  };

  programs.hyprlock.settings = {
    general = {
      disable_loading_bar = true;
      grace = 10;
      hide_cursor = true;
      no_fade_in = true;
    };

    label = {
      text = "$TIME";
      font_size = 96;
      font_family = "JetBrains Mono";
      position = "0, 1000";
      halign = "center";

      shadow_passes = 1;
    };
  };
}
