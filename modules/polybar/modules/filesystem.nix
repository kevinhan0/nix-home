let
  colors = import ../colors.nix;
in
{
  "module/filesystem" = {
    type = "internal/fs";
    interval = "2";
    mount-0 = "/";

    # UI
    label-mounted = " %used% / %total%";
    label-unmounted = " not mounted";
    label-mounted-background = colors.shade4;
    label-mounted-padding = 2;
    label-unmounted-padding = 2;
    label-unmounted-background = colors.shade4;
    label-mounted-foreground = colors.fg;
    label-unmounted-foreground = colors.fg;
  };
}
