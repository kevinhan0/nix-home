let
  colors = import ../colors.nix;
in
{
  "module/spotify" = {
    type = "custom/script";
    interval = "1";
    format-prefix = " ";
    format = "<label>";
    format-padding = 2;
    format-background = colors.shade8;
    format-foreground = colors.fg;
    exec = "$HOME/.nix-profile/bin/python $HOME/Projects/nix-home/modules/polybar/scripts/spotify_status.py -f '{artist}: {song}'";
  };
}
