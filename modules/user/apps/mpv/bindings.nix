{
  home.file.".config/mpv/input.conf".text = ''
    shift+, ignore
    shift+. ignore
    ctrl+, repeatable playlist-prev
    ctrl+. repeatable playlist-next

    # Image-only bindings

    # pan-image is a wrapper around altering video-align that pans
    # relatively to the window's dimensions instead of the image's.
    # +1 scrolls one screen width/height.
    LEFT        {image} repeatable script-message pan-image x +.1
    DOWN        {image} repeatable script-message pan-image y -.1
    UP          {image} repeatable script-message pan-image y +.1
    RIGHT       {image} repeatable script-message pan-image x -.1
    h           {image} repeatable script-message pan-image x +.1
    j           {image} repeatable script-message pan-image y -.1
    k           {image} repeatable script-message pan-image y +.1
    l           {image} repeatable script-message pan-image x -.1
    Shift+LEFT  {image} repeatable script-message pan-image x +.01
    Shift+DOWN  {image} repeatable script-message pan-image y -.01
    Shift+UP    {image} repeatable script-message pan-image y +.01
    Shift+RIGHT {image} repeatable script-message pan-image x -.01
    H           {image} repeatable script-message pan-image x +.01
    J           {image} repeatable script-message pan-image y -.01
    K           {image} repeatable script-message pan-image y +.01
    L           {image} repeatable script-message pan-image x -.01

    # Align the image to the window's boundaries.
    Ctrl+LEFT   {image} no-osd set video-align-x -1
    Ctrl+DOWN   {image} no-osd set video-align-y 1
    Ctrl+UP     {image} no-osd set video-align-y -1
    Ctrl+RIGHT  {image} no-osd set video-align-x 1
    Ctrl+h      {image} no-osd set video-align-x -1
    Ctrl+j      {image} no-osd set video-align-y 1
    Ctrl+k      {image} no-osd set video-align-y -1
    Ctrl+l      {image} no-osd set video-align-x 1

    # Zoom
    = {image} add video-zoom  0.1
    - {image} add video-zoom -0.1
    + {image} add video-zoom  0.01
    _ {image} add video-zoom -0.01
    0 {image} no-osd set video-zoom 0; no-osd set panscan 0

    # Alternatively, these are easier to reach:
    ; {image} add video-zoom +0.1
    : {image} add video-zoom -0.1

    # Toggle scaling the image to the window.
    shift+o {image} no-osd cycle-values video-unscaled yes no; no-osd set video-zoom 0; no-osd set panscan 0

    # panscan crops scaled videos with different aspect ratio than the window.
    # At 1 it fills black bars completely.
    o {image} no-osd set panscan 1; no-osd set video-unscaled no; no-osd set video-zoom 0

    # Toggle the slideshow and change its duration.
    SPACE {image} cycle-values image-display-duration inf 5; set pause no
    [     {image} add image-display-duration -1
    ]     {image} add image-display-duration  1
    {     {image} multiply image-display-duration 0.5
    }     {image} multiply image-display-duration 2

    # This mouse gesture executes one of 5 commands configured in
    # script-opts/image_bindings.conf depending on the direction you drag the
    # mouse.
    MBTN_RIGHT {image} script-binding gesture

    # Pan the image while holding a mouse button, relative to the clicked point in the window.
    MBTN_LEFT {image} script-binding drag-to-pan

    # Pan the image while holding a mouse button, relative to the whole image.
    MBTN_MID   {image} script-binding align-to-cursor

    # Zoom towards where the cursor is hovering.
    WHEEL_UP   {image} script-message cursor-centric-zoom .1
    WHEEL_DOWN {image} script-message cursor-centric-zoom -.1
    WHEEL_LEFT {image} ignore
    WHEEL_RIGHT {image} ignore
  '';
}
