{ pkgs, ... }:

{
  xsession.enable = true;
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = 
      let
        modifier = "Mod4";
      in 
      {
        keybindings = lib.mkOptionDefault {
          "${modifier}+Return" = "exec alacritty";
          "${modifier}+k" = "focus up";
          "${modifier}+j" = "focus down";
          "${modifier}+h" = "focus left";
          "${modifier}+l" = "focus right";
          "${modifier}+Shift+k" = "move up";
          "${modifier}+Shift+j" = "move down";
          "${modifier}+Shift+h" = "move left";
          "${modifier}+Shift+l" = "move right";
          "${modifier}+g" = "exec google-chrome-stable";
          "XF86MonBrightnessUp" = "exec xbacklight -inc 10";
          "XF86MonBrightnessDown" = "exec xbacklight -dec 10";
        }; 
        inherit modifier;  
        bars = [
          {
            mode = "hide";
            #position = "top";
            #statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status-rust.toml}";
          }
        ];
      };
      extraConfig = ''
        for_window [class=".*"] border pixel 0
      '';
  };
}
