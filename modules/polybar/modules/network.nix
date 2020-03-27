let
  colors = import ../colors.nix;
in
{
  "module/network" = {
    type = "internal/network";
    interface = "wlan1";

    # Connected
    label-connected = "直";
    format-connected = "<label-connected>";
    label-connected-foreground = colors.shade7;
    label-connected-padding = 2;

    # Disconnected
    label-disconnected = "睊";
    format-disconnected = "<label-disconnected>";
    label-disconnected-foreground = colors.shade7;
    label-disconnected-padding = 2;
  };
}
