let 
  colors = import ../colors.nix;
in 
{
  "module/cpu" = {
    type = "internal/cpu";
    interval = "0.5";

    # UI
    label = "%percentage%%";
    format = " <label>";
    format-padding = 2;
    format-background = colors.shade6; 
  };

  "module/cpu_ramp" = {
    type = "internal/cpu";
    interval = "0.5";

    # UI
    format = "<ramp-coreload>";
    format-padding = 2;
    format-background = colors.shade6; 

    # Ramp
    ramp-coreload-0 = "▁";
    ramp-coreload-1 = "▂";
    ramp-coreload-2 = "▃";
    ramp-coreload-3 = "▄";
    ramp-coreload-4 = "▅";
    ramp-coreload-5 = "▆";
    ramp-coreload-6 = "▇";
    ramp-coreload-7 = "█";
    ramp-coreload-spacing = 1;
  };
}
