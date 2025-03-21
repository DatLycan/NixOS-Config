{
  pkgs,
  lib,
  ...
}: {
  home = {
    packages = with pkgs; [
      chromium
    ];

    activation = {
      set-brave-preferences = lib.hm.dag.entryAfter ["writeBoundary"] ''
        ${pkgs.coreutils}/bin/cp -f ${./Preferences} ~/.config/BraveSoftware/Brave-Browser/Default/Preferences
      '';
    };
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium
      {id = "gebbhagfogifgggkldgodflihgfeippi";} # Return YT dislikes
      {id = "gkkmiofalnjagdcjheckamobghglpdpm";} # YouTube Windowed FullScreen
      {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden Password Manager
    ];

    commandLineArgs = [
      "--disable-session-crashed-bubble"
    ];
  };
}
