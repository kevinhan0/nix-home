let
  colors = import ../colors.nix;
in
{
  "module/bluetooth" = { 
    type = "custom/script";
    exec = "$HOME/Projects/nix-home/modules/polybar/scripts/bluetooth.sh";
    interval = "2";
    click-left =  "exec $HOME/Projects/nix-home/modules/polybar/scripts/toggle_bluetooth.sh";
    click-right = "exec $HOME/Projects/nix-home/modules/polybar/scripts/toggle_bluetooth.sh";
    format-padding = 2;
    format-background = colors.shade6;
    format-foreground = colors.fg;
  };
}
