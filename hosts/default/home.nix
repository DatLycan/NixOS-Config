{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "datlycan";
  home.homeDirectory = "/home/datlycan";

  home.stateVersion = "24.11";

  home.packages = [

  ];

  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
