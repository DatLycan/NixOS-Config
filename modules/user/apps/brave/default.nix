{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      chromium
    ];
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = [
      {id = "hfjbmagddngcpeloejdejnfgbamkjaeg";} # Vimium
      {id = "gebbhagfogifgggkldgodflihgfeippi";} # Return YT dislikes
      {id = "gkkmiofalnjagdcjheckamobghglpdpm";} # YouTube Windowed FullScreen
    ];

    commandLineArgs = [
      "--disable-session-crashed-bubble"
    ];
  };
}
