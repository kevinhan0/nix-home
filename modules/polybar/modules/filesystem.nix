let
  colors = import ../colors.nix;
in
{
  "module/filesystem" = {
    type = "internal/fs";
    interval = "2";
    mount-0 = "/";

    # UI
    label-mounted = " %used%";
    label-unmounted = " not mounted";
    label-mounted-background = colors.shade6;
    label-mounted-padding = 2;
    label-unmounted-padding = 2;
    label-unmounted-background = colors.shade6;
    label-mounted-foreground = colors.fg;
    label-unmounted-foreground = colors.fg;
  };
}
