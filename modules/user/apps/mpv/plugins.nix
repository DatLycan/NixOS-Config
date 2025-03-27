{
  home.file = {
    ".config/mpv/script-opts/detect_image.conf".text = ''
      command_on_first_image_loaded=apply-profile image; enable-section image; script-message status-line-enable
      command_on_image_loaded=no-osd set video-pan-x 0; script-message align-border "" -1
      command_on_non_image_loaded=apply-profile video; disable-section image; script-message status-line-disable; no-osd set video-pan-x 0; no-osd set video-pan-y 0; no-osd set video-zoom 0
    '';

    ".config/mpv/script-opts/status_line.conf".text = ''
      enabled=no
    '';
  };
}
