let
  colors = import ../colors.nix;
in
{
  "module/battery" = {
    type = "internal/battery";
    full-at = 101;
    battery = "BAT0";
    adapter = "AC0";
    bar-capacity-width = 10;

    # Full
    label-full = "  100%";
    format-full = "<label-full>";
    format-full-padding = 2;
    format-full-background = colors.shade5;

    # Charging
    label-charging = "%percentage%%";
    format-charging = " <animation-charging> <label-charging>";
    format-charging-padding = 2;
    format-charging-background = colors.shade5;

    # Charging animation
    animation-charging-0 = " ";
    animation-charging-1 = " ";
    animation-charging-2 = " ";
    animation-charging-3 = " ";
    animation-charging-4 = " ";
    animation-charging-framerate = 500;

    # Discharging
    label-discharging = "%percentage%%";
    format-discharging = "<ramp-capacity> <label-discharging>";
    format-discharging-padding = 2;
    format-discharging-background = colors.shade5;

    # Ramp
    ramp-capacity-0 = " ";
    ramp-capacity-1 = " ";
    ramp-capacity-2 = " ";
    ramp-capacity-3 = " ";
    ramp-capacity-4 = " ";
    ramp-capacity-0-foreground = colors.red;
    ramp-capacity-1-foreground = colors.red;
  };
}
