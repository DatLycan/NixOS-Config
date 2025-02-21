{
  wayland.windowManager.hyprland.settings = {
    bind = [ 
      "$mainMod, SUPER_L, exec, $menu"
      "$mainMod, R, exec, $terminal"
      "$mainMod, E, exec, $fileManager"
      
      "$mainMod, F12, exit,"
      "$mainMod, Q, killactive,"
      "$mainMod, F, togglefloating,"
      "$mainMod, P, pseudo,"
      "$mainMod, S, togglesplit,"

      # Moving focus
      "$mainMod, H, movefocus, l"
      "$mainMod, J, movefocus, d"
      "$mainMod, K, movefocus, u"
      "$mainMod, L, movefocus, r"

      # Resizeing windows                   X  Y
      "$mainMod SHIFT, H, resizeactive,  -60 0"
      "$mainMod SHIFT, J,  resizeactive,  0  60"
      "$mainMod SHIFT, K,    resizeactive,  0 -60"
      "$mainMod SHIFT, L,  resizeactive, 60 0"

      # Switching workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Moving windows to workspaces
      "$mainMod TAB, 1, movetoworkspace, 1"
      "$mainMod TAB, 2, movetoworkspace, 2"
      "$mainMod TAB, 3, movetoworkspace, 3"
      "$mainMod TAB, 4, movetoworkspace, 4"
      "$mainMod TAB, 5, movetoworkspace, 5"
      "$mainMod TAB, 6, movetoworkspace, 6"
      "$mainMod TAB, 7, movetoworkspace, 7"
      "$mainMod TAB, 8, movetoworkspace, 8"
      "$mainMod TAB, 9, movetoworkspace, 9"
      "$mainMod TAB, 0, movetoworkspace, 10"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  }; 
}
