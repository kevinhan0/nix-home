{ pkgs, ... }:

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

      # Bars
      "bar/top" = (import ./bars/top.nix)."bar/top";
      "bar/bottom" = (import ./bars/bottom.nix)."bar/bottom";

      # Modules
      "module/audio" = (import ./modules/audio.nix)."module/audio";
      "module/battery" = (import ./modules/battery.nix)."module/battery";
      "module/bluetooth" = (import ./modules/bluetooth.nix)."module/bluetooth";
      "module/calendar" = (import ./modules/calendar.nix)."module/calendar";
      "module/clock" = (import ./modules/clock.nix)."module/clock";
      "module/cpu" = (import ./modules/cpu.nix)."module/cpu";
      "module/filesystem" = (import ./modules/filesystem.nix)."module/filesystem";
      "module/i3" = (import ./modules/i3-module.nix)."module/i3";
      "module/memory" = (import ./modules/memory.nix)."module/memory";
      "module/mpd" = (import ./modules/mpd-module.nix)."module/mpd";
      "module/spotify" = (import ./modules/spotify-module.nix)."module/spotify";
      "module/temperature" = (import ./modules/temperature.nix)."module/temperature";
    };
  };
}
