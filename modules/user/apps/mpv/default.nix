{pkgs, ...}: let
  folderpath = ./.;
  files = builtins.attrNames (builtins.readDir folderpath);
  nixfiles = builtins.filter (name: name != "default.nix" && builtins.match ".*\\.nix" name != null) files;
  currentDir = map (name: import (folderpath + "/${name}")) nixfiles;
in {
  imports = currentDir;

  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        scripts = with pkgs; [
          mpvScripts.mpv-webm
          mpvScripts.builtins.autoload

          mpvScripts.mpv-image-viewer.detect-image
          mpvScripts.mpv-image-viewer.image-positioning
          mpvScripts.mpv-image-viewer.status-line
        ];

        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
        };
      }
    );
  };

  home.packages = with pkgs; [
    nodePackages.peerflix # Used for torrent streaming
  ];

  xdg.mimeApps.defaultApplications = {
    "image/jpg" = ["mpv.desktop"];
    "image/jpeg" = ["mpv.desktop"];
    "image/png" = ["mpv.desktop"];
    "image/gif" = ["mpv.desktop"];
    "image/webp" = ["mpv.desktop"];
  };
}
