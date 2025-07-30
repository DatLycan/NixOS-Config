{pkgs, ...}: {
  imports = [
    ./vscode
    ./monogame
  ];

  home.packages = with pkgs; [
    mono
    dotnet-sdk
    dotnetPackages.Nuget
    csharpier
    csharprepl
  ];
}
