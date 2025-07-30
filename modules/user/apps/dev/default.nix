{pkgs, ...}: {
  imports = [
    ./vscode
    ./monogame.nix
  ];

  home.packages = with pkgs; [
    mono
    dotnet-sdk
    dotnetPackages.Nuget
    csharpier
    csharprepl
  ];
}
