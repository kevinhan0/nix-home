{ pkgs, ... }:

let
  bg = "#1F1F1F";
  fg = "#FFFFFF";
  acolor = "#FFFFFF";
  curgent = "#EF5350";
  coccupied = "#42A5F5";
  urgency = "#e74c3c";

  # Shades
  shade1 = "#0D47A1";
  shade2 = "#1565C0";
  shade3 = "#1976D2";
  shade4 = "#1E88E5";
  shade5 = "#2196F3";
  shade6 = "#42A5F5";
  shade7 = "#64B5F6";
  shade8 = "#90CAF9";
  ashade8 = "#2C2C2C";

  # 50 Shades of Gray
  gray_shade1 = "#212121";
  gray_shade2 = "#424242";
  gray_shade3 = "#616161";
  gray_shade4 = "#757575";
  gray_shade5 = "#9E9E9E";
  gray_shade6 = "#BDBDBD";
  gray_shade7 = "#D4D4D4";
  gray_shade8 = "#EEEEEE";
  gray_ashade8 = "#2C2C2C";

  # Material Colors
  red = "#e53935";
  pink = "#d81b60";
  purple = "#8e24aa";
  deep-purple = "#5e35b1";
  indigo = "#3949ab";
  blue = "#1e88e5";
  light-blue = "#039be5";
  cyan = "#00acc1";
  teal = "#00897b";
  green = "#43a047";
  light-green = "#7cb342";
  lime = "#c0ca33";
  yellow = "#fdd835";
  amber = "#ffb300";
  orange = "#fb8c00";
  deep-orange = "#f4511e";
  brown = "#6d4c41";
  grey = "#757575";
  blue-gray = "#546e7a";

in
  {
    services.polybar = { 
      enable = true;
    
      package = pkgs.polybar.override {
        i3GapsSupport = true;
        alsaSupport = true;
        mpdSupport = true;
        #iwSupport = true;
      };

      script = "polybar -q -r top &";

      config = {
        "global/wm" = {
          margin-bottom = 0;
          margin-top = 0;
        };

        "bar/top" = {
          # Position
          width = "100%";
          height = 32;
          offset-x = "2%";
          offset-y = "2%";
          bottom = false;
          fixed-center = false;

          # UI
          background = bg;
          foreground = fg;
          font-0 = "FiraCode Nerd Font:size=10;3";
          font-1 = "FiraCode Nerd Font:style=Bold:size=10;3";

          # Modules
          modules-left = "i3";
          modules-right = "mpd network audio battery calendar clock powermenu";

          # Settings
          locale = "en_US.UTF-8";
          scroll-up = "i3wm-wsnext";
          scroll-down = "i3wm-wsprev";
        };

        "bar/bottom" = {
          # Position
          width = "100%";
          height = 19;
          offset-x = "2%";
          offset-y = "2%";
          bottom = true;
          fixed-center = true;          

          # UI
          foreground = fg;
          background = bg;
          font-0 = "FiraCode Nerd Font:size=10;3";
          font-1 = "FiraCode Nerd Font:style=Bold:size=10;3";

          # Modules
          modules-right = "cpu_ramp cpu memory temperature";

          # Setting
          locale = "en_US.UTF-8";
        };

        "settings" = {
          throttle-output = 5;
          throttle-output-for = 10;
          throttle-input-for = 30;
          screenchange-reload = true;
          compositing-background = "source";
          compositing-foreground = "over";
          compositing-overline = "over";
          comppositing-underline = "over";
          compositing-border = "over";
          pseudo-transparency = "false";
        };

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
          #format-background = shade2;
          label-mode = "%mode%";
          label-mode-padding = 2;

          # Focused
          label-focused = "%index%";
          label-focused-padding = 2;
          label-focused-background = shade1;

          # Unfocused
          label-unfocused = "%index%";
          label-unfocused-padding = 2;
          label-unfocused-background = shade2;

          # Urgent
          label-urgent = "%index%";
          label-urgent-padding = 2;
          label-urgent-foreground = curgent;

          # Settings
          enable-click = true;
          enable-scroll = false;
          pin-workspaces = false;
          strip-wsnumbers = true;
        };

        "module/mpd" = {
          type = "internal/mpd";
          host = "localhost";
          port = 6600;
          interval = 1;
          label-song = "%artist% - %title%";

          # UI
          icon-play = "喇 ";
          icon-pause = " ";
          format-online-padding = 2;
          format-online-background = shade8;
          format-online-foreground = ashade8;
          format-online = "<toggle> <label-song>";

          # Settings
          label-song-maxlen = "25";
          label-song-ellipsis = "true";
        };

        "module/network" = {
          type = "internal/network";
          interface = "wlan1";

          # Connected
          label-connected = "直";
          format-connected = "<label-connected>";
          label-connected-foreground = shade7;
          label-connected-padding = 2;

          # Disconnected
          label-disconnected = "睊";
          format-disconnected = "<label-disconnected>";
          label-disconnected-foreground = shade7;
          label-disconnected-padding = 2;
        };

        "module/audio" = {
          type = "internal/alsa";

          # Volume
          label-volume = "%percentage%%";
          format-volume = "<ramp-volume> <label-volume>";
          format-volume-padding = 2;
          format-volume-background = shade6;

          # Muted
          label-muted = "婢";
          label-muted-padding = 2;
          label-muted-background = shade6;

          # Ramp
          ramp-volume-0 = "";
          ramp-volume-1 = "";
          ramp-volume-2 = "";
          ramp-volume-3 = "";
          ramp-volume-4 = "墳";
          ramp-volume-5 = "墳";
          ramp-volume-6 = "";
        };

        "module/battery" = {
          type = "internal/battery";
          full-at = 101;
          battery = "BAT0";
          adapter = "AC0";
          bar-capacity-width = 10;

          # Full
          label-full = "  100%";
          format-full = "<label-full>";
          format-full-padding = 2;
          format-full-background = shade5;

          # Charging
          label-charging = "%percentage%%";
          format-charging = " <animation-charging> <label-charging>";
          format-charging-padding = 2;
          format-charging-background = shade5;

          # Charging animation
          animation-charging-0 = " ";
          animation-charging-1 = " ";
          animation-charging-2 = " ";
          animation-charging-3 = " ";
          animation-charging-4 = " ";
          animation-charging-framerate = 500;

          # Discharging
          label-discharging = "%percentage%%";
          format-discharging = "<ramp-capacity> <label-discharging>";
          format-discharging-padding = 2;
          format-discharging-background = shade5;

          # Ramp
          ramp-capacity-0 = " ";
          ramp-capacity-1 = " ";
          ramp-capacity-2 = " ";
          ramp-capacity-3 = " ";
          ramp-capacity-4 = " ";
          ramp-capacity-0-foreground = red;
          ramp-capacity-1-foreground = red;
        };

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
          label-background = shade4;
        };

        "module/clock" = {
          type = "internal/date"; 
          interval = "1.0";

          # Time
          time = " %I:%M %p";
          time-alt = " %H:%M:%S";

          # UI
          format = "<label>";
          label = "%time%";
          label-padding = 2;
          label-background = shade3;
        };

        "module/powermenu" = {
          type = "custom/menu";

          # UI
          format = "<label-toggle> <menu>";
          format-background = shade2;
          format-foreground = fg;
          format-padding = 2;

          # Menu
          label-open = "  ";
          label-close = "";
          menu-0-0 = "  ";
          menu-0-1 = "  ";
          menu-0-2 = "  ";
          menu-0-0-exec = "systemctl suspend";
          menu-0-1-exec = "systemctl reboot";
          menu-0-2-exec = "systemctl poweroff";
        };

        "module/cpu_ramp" = {
          type = "internal/cpu";
          interval = "0.5";

          # UI
          format = "<ramp-coreload>";
          format-padding = 2;
          format-background = gray_shade6; 

          # Ramp
          ramp-coreload-0 = "▁";
          ramp-coreload-1 = "▂";
          ramp-coreload-2 = "▃";
          ramp-coreload-3 = "▄";
          ramp-coreload-4 = "▅";
          ramp-coreload-5 = "▆";
          ramp-coreload-6 = "▇";
          ramp-coreload-7 = "█";
          ramp-coreload-spacing = 1;
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = "0.5";

          # UI
          label = "CPU %percentage%%";
          format = " <label>";
          format-padding = 2;
          format-background = gray_shade5; 
        };

        "module/memory" = {
          type = "internal/memory"; 
          interval = 3;

          # UI
          format = "<label>";
          label = " RAM %percentage_used%%";
          format-padding = 2; 
          format-background = gray_shade4;
        };

        "module/temperature" = {
          type = "internal/temperature";
          interval = "0.5";

          # Settings
          thermal-zone = 0;
          base-temperature = 20;
          warn-temperature = 60;
          units = true;

          # UI
          format = "<ramp> <label>";
          format-padding = 2;
          format-background = gray_shade3;

          # Warning
          label = "TEMP %temperature-c%";
          label-warn = "TEMP %temperature-c%";
          format-warn = "<ramp> <label-warn>";
          format-warn-padding = 2;
          format-warn-background = gray_shade3;

          # Ramp
          ramp-0 = "";
          ramp-1 = "";
          ramp-2 = "";
          ramp-3 = "";
          ramp-4 = "";
        };
      };
    };
  }
