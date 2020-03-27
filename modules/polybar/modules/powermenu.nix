let
  colors = import ../colors.nix;
in
{
  "module/suspend" = {
    type = "custom/text";
    click-left = "exec /run/current-system/sw/bin/systemctl suspend && /home/kevinhan0//.nix-profile/bin/i3lock-fancy";
    click-right = "exec /run/current-system/sw/bin/systemctl suspend && /home/kevinhan0//.nix-profile/bin/i3lock-fancy";
    content = "";
    content-padding = 2;
    content-background = colors.shade1;
    content-foreground = colors.fg;
  };

  "module/reboot" = {
    type = "custom/text";
    click-left = "exec /run/current-system/sw/bin/systemctl reboot";
    click-right = "exec /run/current-system/sw/bin/systemctl reboot";
    content = "";
    content-padding = 2;
    content-background = colors.shade1;
    content-foreground = colors.fg;
  };

  "module/poweroff" = {
    type = "custom/text";
    click-left = "exec /run/current-system/sw/bin/systemctl poweroff";
    click-right = "exec /run/current-system/sw/bin/systemctl poweroff";
    content = "";
    content-padding = 2;
    content-background = colors.shade1;
    content-foreground = colors.fg;
  };
}
