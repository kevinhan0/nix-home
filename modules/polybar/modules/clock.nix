let
  colors = import ../colors.nix;
in
{
  "module/clock" = {
    type = "internal/date"; 
    interval = "1.0";

    # Time
    time = " %I:%M %p";
    time-alt = " %H:%M:%S";

    # UI
    format = "<label>";
    label = "%time%";
    label-padding = 2;
    label-background = colors.shade3;
  };
}
