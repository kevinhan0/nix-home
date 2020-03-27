let
  colors = import ../colors.nix;
in
{
  "module/temperature" = {
    type = "internal/temperature";
    interval = "0.5";

    # Settings
    thermal-zone = 0;
    base-temperature = 20;
    warn-temperature = 60;
    units = true;

    # UI
    format = "<ramp> <label>";
    format-padding = 2;
    format-background = colors.shade2;

    # Warning
    label = "TEMP %temperature-c%";
    label-warn = "TEMP %temperature-c%";
    format-warn = "<ramp> <label-warn>";
    format-warn-padding = 2;
    format-warn-background = colors.shade2;

    # Ramp
    ramp-0 = "";
    ramp-1 = "";
    ramp-2 = "";
    ramp-3 = "";
    ramp-4 = "";
  };
}
