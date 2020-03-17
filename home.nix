{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/neovim/neovim.nix
    ./modules/zsh/zsh.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "19.09";

  xdg.configFile = {
    "alacritty/alacritty.yml".source = modules/alacritty/alacritty.yml;
  };

  home.packages = with pkgs; [
    alacritty
    exa
    bat
    curl
    docker
    feh
    git
    google-chrome
    htop
    i3lock-fancy
    jq
    kubectl
    neofetch
    nix-prefetch-git
    openvpn
    #pandoc
    #texlive.combined.scheme-basic
    tree
    wget
    #xorg.xbacklight
  ];

  #fonts.fontconfig.enable = true;

  #services.polybar = {
  #  enable = true;
  #  package = pkgs.polybar.override {
  #    #i3GapsSupport = true;
  #  };
  #    config = {
  #      "bar/top" = {
  #        width = "100%:-20";
  #        height = 25;
  #        offset-x = 10;
  #        offset-y = 4;
  #        tray-position = "right";
  #        modules-right = "date battery";
  #        modules-left = "i3";
  #        module-margin = 1;
  #        font-0 = "Source Han Code JP:weight=bold:size=10;3";
  #        background = "#282828";
  #        foreground = "#fbf1c7";
  #        fixed-center = true;
  #        border-size = 4;
  #        border-color = "#689d6a";
  #      };
  #      "module/date" = {
  #        type = "internal/date";
  #        interval = 30;
  #        date = "%Y-%m-%d";
  #        time = "%H:%M";
  #        label = "%date% %time%";
  #      };
  #      "module/battery" = {
  #        type = "internal/battery";
  #        full-at = 98;
  #        label-charging = "! %percentage%%";
  #      };
  #      "module/i3" = {
  #        type = "internal/i3";
  #        enable-click = true;
  #        ws-icon-0 = "1;♚";
  #      };
  #    };
  #    script = "polybar top &";
  #};

  programs.git = {
    enable = true;
    userName = "kevinhan0";
    userEmail = "yxh204@nyu.edu";
  };

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

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
  };

  programs.tmux = {
    enable = true;
    extraConfig = import ./tmux.nix;
    terminal = "screen-256color";
  };
}
