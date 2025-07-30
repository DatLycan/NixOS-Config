{pkgs, ...}: {
  home.packages = with pkgs; [
    freetype
    libGL
    pulseaudio
    xorg.libX11
    xorg.libXrandr
  ];

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet/";
    LD_LIBRARY_PATH =
      "${pkgs.lib.makeLibraryPath [
        pkgs.freetype
        pkgs.libGL
        pkgs.pulseaudio
        pkgs.xorg.libX11
        pkgs.xorg.libXrandr
      ]}:"
      + (builtins.getEnv "LD_LIBRARY_PATH");
  };
}
