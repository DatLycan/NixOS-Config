{pkgs, ...}: {
  imports = [
    ./vscode
    ./lib.nix
  ];

  home.packages = with pkgs; [
    mono
    dotnet-sdk
    dotnetPackages.Nuget
    csharpier
    csharprepl
  ];
}
