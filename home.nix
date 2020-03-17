{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/neovim/neovim.nix
    ./modules/zsh/zsh.nix
    ./modules/i3/i3.nix
    ./modules/alacritty/alacritty.nix
    ./modules/tmux/tmux.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "19.09";

  home.packages = with pkgs; [
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
    pandoc
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
}
