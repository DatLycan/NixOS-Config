{ config, pkgs, system, modulesPath, ... }:

{
  imports =
  [ 
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  default-user.enable = true;
}
