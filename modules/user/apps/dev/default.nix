{pkgs, ...}: {
  imports = [
    ./vscode
  ];

  home.packages = with pkgs; [
    mono
    dotnet-sdk
    dotnetPackages.Nuget
    csharpier
    csharprepl
  ];
}
