{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.peerflix # Used for torrent streaming
  ];

  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        scripts = with pkgs; [
          mpvScripts.builtins.autoload
          mpvScripts.mpv-webm
        ];

        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
        };
      }
    );
  };
}
