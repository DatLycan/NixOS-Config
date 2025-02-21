{
  wayland.windowManager.hyprland.settings = {
    bind = [ 
      "$MOD, SUPER_L, exec, $MENU"
      "$MOD, R, exec, $TERMINAL"
      "$MOD, E, exec, $FILE_MAN"
      
      "$MOD, F12, exit,"
      "$MOD, Q, killactive,"
      "$MOD, F, togglefloating,"
      "$MOD, P, pseudo,"
      "$MOD, S, togglesplit,"

      # Moving focus
      "$MOD, H, movefocus, l"
      "$MOD, J, movefocus, d"
      "$MOD, K, movefocus, u"
      "$MOD, L, movefocus, r"

      # Resizeing windows                   X  Y
      "$MOD SHIFT, H, resizeactive,  -60 0"
      "$MOD SHIFT, J,  resizeactive,  0  60"
      "$MOD SHIFT, K,    resizeactive,  0 -60"
      "$MOD SHIFT, L,  resizeactive, 60 0"

      # Switching workspaces
      "$MOD, 1, workspace, 1"
      "$MOD, 2, workspace, 2"
      "$MOD, 3, workspace, 3"
      "$MOD, 4, workspace, 4"
      "$MOD, 5, workspace, 5"
      "$MOD, 6, workspace, 6"
      "$MOD, 7, workspace, 7"
      "$MOD, 8, workspace, 8"
      "$MOD, 9, workspace, 9"
      "$MOD, 0, workspace, 10"

      # Moving windows to workspaces
      "$MOD TAB, 1, movetoworkspace, 1"
      "$MOD TAB, 2, movetoworkspace, 2"
      "$MOD TAB, 3, movetoworkspace, 3"
      "$MOD TAB, 4, movetoworkspace, 4"
      "$MOD TAB, 5, movetoworkspace, 5"
      "$MOD TAB, 6, movetoworkspace, 6"
      "$MOD TAB, 7, movetoworkspace, 7"
      "$MOD TAB, 8, movetoworkspace, 8"
      "$MOD TAB, 9, movetoworkspace, 9"
      "$MOD TAB, 0, movetoworkspace, 10"
    ];

    bindm = [
      "$MOD, mouse:272, movewindow"
      "$MOD, mouse:273, resizewindow"
    ];
  }; 
}
