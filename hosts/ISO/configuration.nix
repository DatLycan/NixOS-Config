{ pkgs, system, modulesPath, ... }:

{
  imports =
  [ 
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = system;
}
