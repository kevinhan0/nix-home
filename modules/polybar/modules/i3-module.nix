let
  colors = import ../colors.nix;
in
{
  "module/i3" = {
    type = "internal/i3";

    # Icons
    ws-icon-0 = "1;";
    ws-icon-1 = "2;";
    ws-icon-2 = "3;";
    ws-icon-3 = "4;";
    ws-icon-4 = "5;";
    ws-icon-5 = "6;";
    ws-icon-6 = "7;";
    ws-icon-7 = "8;";
    ws-icon-8 = "9;";

    format = "<label-state> <label-mode>";
    label-mode = "%mode%";
    label-mode-padding = 2;

    # Focused
    label-focused = "%index%";
    label-focused-padding = 2;
    label-focused-background = colors.shade1;

    # Unfocused
    label-unfocused = "%index%";
    label-unfocused-padding = 2;
    label-unfocused-background = colors.shade2;

    # Urgent
    label-urgent = "%index%";
    label-urgent-padding = 2;
    label-urgent-foreground = colors.curgent;

    # Settings
    enable-click = true;
    enable-scroll = false;
    pin-workspaces = false;
    strip-wsnumbers = true;
  };
}
