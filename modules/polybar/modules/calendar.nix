let
  colors = import ../colors.nix;
in
{
  "module/calendar" = {
    type = "internal/date"; 
    interval = "1.0";

    # Date
    date = " %a, %m/%d";
    date-alt = " %A, %m/%d/%Y"; 

    # UI
    format = "<label>";
    label = "%date%";
    label-padding = 2;
    label-background = colors.shade2;
  };
}
