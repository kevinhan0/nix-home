{ lib, pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
      modifier = "Mod4";
      bars = [];
      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec termite -e $(which zsh)";
        "${modifier}+k" = "focus up";
        "${modifier}+j" = "focus down";
        "${modifier}+h" = "focus left";
        "${modifier}+l" = "focus right";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+l" = "move right";
        "${modifier}+g" = "exec google-chrome-stable";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
        "XF86MonBrightnessUp" = "exec xbacklight -inc 10";
        "XF86MonBrightnessDown" = "exec xbacklight -dec 10";
        "XF86AudioMute" = "exec amixer set Master toggle";
        "XF86AudioLowerVolume" = "exec amixer set Master 4%-";
        "XF86AudioRaiseVolume" = "exec amixer set Master 4%+";
      }; 
      window.border = 0;      
      gaps = {
        inner = 15;
        outer = 5;
      };
      startup = [
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/Pictures/background.png";
          always = true;
          notification = false;
        }
      ];
    };
    extraConfig = ''
      for_window [class=".*"] border pixel 0
    '';
  };
}
