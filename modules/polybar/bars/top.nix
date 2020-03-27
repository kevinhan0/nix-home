let
  colors = import ../colors.nix;
in
{
  "bar/top" = {
    # Position
    width = "100%";
    height = 32;
    offset-x = "2%";
    offset-y = "2%";
    bottom = false;
    fixed-center = false;

    # UI
    background = colors.bg;
    foreground = colors.fg;
    font-0 = "FiraCode Nerd Font:size=9;3";
    font-1 = "FiraCode Nerd Font:style=Bold:size=9;3";

    # Modules
    modules-left = "i3";
    modules-right = "spotify network audio battery calendar clock powermenu";

    # Settings
    locale = "en_US.UTF-8";
    scroll-up = "i3wm-wsnext";
    scroll-down = "i3wm-wsprev";
  };
}
