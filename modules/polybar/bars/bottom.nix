let
  colors = import ../colors.nix;
in
{
  "bar/bottom" = {
    # Position
    width = "100%";
    height = 32;
    offset-x = "2%";
    offset-y = "2%";
    bottom = true;
    fixed-center = true;          

    # UI
    foreground = colors.fg;
    background = colors.bg;
    font-0 = "FiraCode Nerd Font:size=9;3";
    font-1 = "FiraCode Nerd Font:style=Bold:size=9;3";

    # Modules
    modules-right = "cpu_ramp cpu filesystem memory temperature";

    # Setting
    locale = "en_US.UTF-8";
  };
}
