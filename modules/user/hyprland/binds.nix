{
  wayland.windowManager.hyprland.settings = {
    "$MOD" = "SUPER";
    "$TERMINAL" = "foot fish";
    "$FILE_MAN" = "foot superfile";
    "$MENU" = "tofi-drun";   

    bind = [ 
      # Actions
      "$MOD, SUPER_L, exec, $MENU"
      "$MOD, R, exec, $TERMINAL"
      "$MOD, E, exec, $FILE_MAN"
      
      "$MOD, F, togglefloating,"
      "$MOD, Q, killactive,"
      "$MOD CTRL, Q, exit,"
      "$MOD CTRL, R, exec, hyprctl reload"

      # Moving focus
      "$MOD, H, movefocus, l"
      "$MOD, J, movefocus, d"
      "$MOD, K, movefocus, u"
      "$MOD, L, movefocus, r"

      # Resizeing windows          X  Y
      "$MOD, left, resizeactive,  -100 0"
      "$MOD, down,  resizeactive,  0  100"
      "$MOD, up,    resizeactive,  0 -100"
      "$MOD, right,  resizeactive, 100 0"

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
      "$MOD SHIFT, 1, movetoworkspacesilent, 1"
      "$MOD SHIFT, 2, movetoworkspacesilent, 2"
      "$MOD SHIFT, 3, movetoworkspacesilent, 3"
      "$MOD SHIFT, 4, movetoworkspacesilent, 4"
      "$MOD SHIFT, 5, movetoworkspacesilent, 5"
      "$MOD SHIFT, 6, movetoworkspacesilent, 6"
      "$MOD SHIFT, 7, movetoworkspacesilent, 7"
      "$MOD SHIFT, 8, movetoworkspacesilent, 8"
      "$MOD SHIFT, 9, movetoworkspacesilent, 9"
      "$MOD SHIFT, 0, movetoworkspacesilent, 10"
    ];

    bindm = [
      "$MOD, mouse:272, movewindow"
      "$MOD, mouse:273, resizewindow"
    ];
  }; 
}
