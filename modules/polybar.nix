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
      };

      script = "polybar -q -r top & polybar -q -r bottom &";

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
          modules-right = "audio battery network calendar clock powermenu";

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
          fixed-center = false;          

          # UI
          background = bg;
          foreground = fg;
          font-0 = "FiraCode Nerd Font:size=10;3";
          font-1 = "FiraCode Nerd Font:style=Bold:size=10;3";

          # Misc.
          radius-top = 0;        
          tray-position = "left";
          tray-detached = false;
          tray-maxsize = 15;
          #tray-background = primary;
          tray-offset-x = -19;
          tray-offset-y = 0;
          tray-padding = 5;
          tray-scale = 1;
          padding = 0;
          #modules-left = "powermenu ddlS";

          # Modules
          modules-right = "cpu memory temperature";

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

        "module/cpu" = {
          type = "internal/cpu";
          interval = "0.5";
          label = "CPU %percentage%%";
          format = " <label> <ramp-coreload>";
          #format-foreground = quaternary;
          #format-background = secondary;
          #format-padding = 1;
          ramp-coreload-spacing = 1;
          ramp-coreload-0 = "▁";
          ramp-coreload-1 = "▂";
          ramp-coreload-2 = "▃";
          ramp-coreload-3 = "▄";
          ramp-coreload-4 = "▅";
          ramp-coreload-5 = "▆";
          ramp-coreload-6 = "▇";
          ramp-coreload-7 = "█";
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
          format-background = shade2;
          label-mode = "%mode%";
          label-mode-padding = 1;

          # Focused
          label-focused = "%index%";
          label-focused-padding = 1;
          label-focused-foreground = acolor;

          # Unfocused
          label-unfocused = "%index%";
          label-unfocused-padding = 1;
          label-unfocused-foreground = fg;

          # Visible
          label-visible = "%index%";
          label-visible-padding = 1;
          label-visible-foreground = coccupied;

          # Urgent
          label-urgent = "%index%";
          label-urgent-padding = 1;
          label-urgent-foreground = curgent;

          # Settings
          enable-click = true;
          enable-scroll = false;
          pin-workspaces = false;
          strip-wsnumbers = true;
        };

        "module/memory" = {
          type = "internal/memory"; 
          interval = 3;
          format = "<label>";
          label = " RAM %percentage_used%%";
          #format-background = tertiary;
          #format-foreground = secondary;
          #format-padding = 1; 
        };

        #"module/network" = {
        #  type = "internal/network";
        #  interface = "enp3s0";

        #  interval = "1.0";

        #  accumulate-stats = true;
        #  unknown-as-up = true;

        #  format-connected = "<label-connected>";
        #  #format-connected-background = mf;
        #  #format-connected-underline = bg;
        #  #format-connected-overline = bg;
        #  #format-connected-padding = 2;
        #  #format-connected-margin = 0;
        #  
        #  #format-disconnected = "<label-disconnected>";
        #  #format-disconnected-background = mf;
        #  #format-disconnected-underline = bg;
        #  #format-disconnected-overline = bg;
        #  #format-disconnected-padding = 2;
        #  #format-disconnected-margin = 0;
        #  
        #  label-connected = "D %downspeed:2% | U %upspeed:2%";
        #  label-disconnected = "DISCONNECTED";
        #};

        "module/temperature" = {
          type = "internal/temperature";
          interval = "0.5";
          thermal-zone = 0; # TODO: Find a better way to fill that
          base-temperature = 20;
          warn-temperature = 60;
          units = true;

          format = "<ramp> <label>";
          #format-background = mf;
          #format-underline = bg;
          #format-overline = bg;
          #format-padding = 2;
          #format-margin = 0;
          
          format-warn = "<ramp> <label-warn>";
          #format-warn-background = mf;
          #format-warn-underline = bg;
          #format-warn-overline = bg;
          #format-warn-padding = 2;
          #format-warn-margin = 0;
          label = "TEMP %temperature-c%";
          label-warn = "TEMP %temperature-c%";
          #label-warn-foreground = "#f00"; 
          ramp-0 = "";
          ramp-1 = "";
          ramp-2 = "";
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

        #"module/wireless-network" = {
        #  type = "internal/network";
        #  interval = "wlp2s0";
        #};

      };
    };
  }
