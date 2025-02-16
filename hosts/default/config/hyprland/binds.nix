{
  wayland.windowManager.hyprland.settings = {
    mainMod = "SUPER";

    binds = [
      { key = "$mainMod, Q"; action = "exec, kitty"; }
      { key = "$mainMod, C"; action = "killactive,"; }
      { key = "$mainMod, M"; action = "exit,"; }
      { key = "$mainMod, E"; action = "exec, dolphin"; }
      { key = "$mainMod, V"; action = "togglefloating,"; }
      { key = "$mainMod, R"; action = "exec, wofi --show drun"; }
      { key = "$mainMod, P"; action = "pseudo,"; }
      { key = "$mainMod, J"; action = "togglesplit,"; }
    ];
  };
}
