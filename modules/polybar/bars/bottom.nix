let
  colors = import ../colors.nix;
in
{
  "bar/bottom" = {
    # Position
    width = "10%";
    height = 32;
    offset-x = "50%";
    offset-y = "50%";
    bottom = true;
    fixed-center = true;

    # UI
    foreground = colors.fg;
    background = colors.bg;
    font-0 = "FiraCode Nerd Font:size=9;3";
    font-1 = "FiraCode Nerd Font:style=Bold:size=9;3";

    # Modules
    modules-center = "i3";

    # Setting
    locale = "en_US.UTF-8";
  };
}
