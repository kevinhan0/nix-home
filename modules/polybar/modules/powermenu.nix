let
  colors = import ../colors.nix;
in
{
  "module/powermenu" = {
    type = "custom/menu";

    # UI
    format = "<label-toggle> <menu>";
    format-background = colors.shade2;
    format-foreground = colors.fg;
    format-padding = 2;

    # Menu
    label-open = "  ";
    label-close = "";
    menu-0-0 = "  ";
    menu-0-1 = "  ";
    menu-0-2 = "  ";
    menu-0-0-exec = "systemctl suspend && i3lock-fancy";
    menu-0-1-exec = "systemctl reboot";
    menu-0-2-exec = "systemctl poweroff";
  };
}
