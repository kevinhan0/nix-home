let
  colors = import ../colors.nix;
in
{
  "module/audio" = {
    type = "internal/alsa";

    # Volume
    label-volume = "%percentage%%";
    format-volume = "<ramp-volume> <label-volume>";
    format-volume-padding = 2;
    format-volume-background = colors.shade4;

    # Muted
    label-muted = "婢";
    label-muted-padding = 2;
    label-muted-background = colors.shade4;

    # Ramp
    ramp-volume-0 = "";
    ramp-volume-1 = "";
    ramp-volume-2 = "";
    ramp-volume-3 = "";
    ramp-volume-4 = "墳";
    ramp-volume-5 = "墳";
    ramp-volume-6 = "";
  };
}
