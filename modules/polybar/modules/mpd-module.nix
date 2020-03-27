let
  colors = import ../colors.nix;
in
{
  "module/mpd" = {
    type = "internal/mpd";
    host = "localhost";
    port = 6600;
    interval = 1;
    label-song = "%artist% - %title%";

    # UI
    icon-play = "喇 ";
    icon-pause = " ";
    format-online-padding = 2;
    format-online-background = colors.shade8;
    format-online-foreground = colors.ashade8;
    format-online = "<toggle> <label-song>";

    # Settings
    label-song-maxlen = "25";
    label-song-ellipsis = "true";
  };
}
