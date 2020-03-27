let
  colors = import ../colors.nix;
in
{
  "module/memory" = {
    type = "internal/memory"; 
    interval = 3;

    # UI
    format = "<label>";
    label = " %percentage_used%%";
    format-padding = 2; 
    format-background = colors.shade2;
  };
}
