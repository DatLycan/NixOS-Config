{pkgs, ...}: {
  home.packages = with pkgs; [btop];

  programs.btop.settings = {
    color_theme = "TTY";
    theme_background = true;
  };
}
