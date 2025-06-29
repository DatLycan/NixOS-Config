{pkgs, ...}: {
  imports = [
    ./vscode
  ];

  home.packages = with pkgs; [
    dotnetCorePackages.dotnet_8.sdk
    dotnetPackages.Nuget
  ];
}
