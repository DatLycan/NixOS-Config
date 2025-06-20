{pkgs, ...}: {
  imports = [
    ./vscode
  ];

  home.packages = with pkgs; [
    rustup
    gcc
    dotnetCorePackages.dotnet_8.sdk
    dotnetPackages.Nuget
  ];
}
