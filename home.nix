{ config, lib, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  imports = [
    ./modules/neovim/neovim.nix
    ./modules/zsh/zsh.nix
    ./modules/i3/i3.nix
    ./modules/alacritty/alacritty.nix
    ./modules/tmux/tmux.nix
    ./modules/rofi/rofi.nix
    ./modules/polybar/polybar.nix
    ./modules/termite/termite.nix
  ];

  programs.home-manager.enable = true;

  gtk = {
    enable=true;
    font = {
      name = "Meslo LG S for Powerline";
      package = pkgs.meslo-lg;
    };
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };
  };

  home.stateVersion = "19.09";

  home.packages = with pkgs; [
    bat
    conky
    curl
    docker
    exa
    feh
    fontconfig
    git
    google-chrome
    htop
    jq
    kubectl
    neofetch
    nix-prefetch-git
    openvpn
    pandoc
    texlive.combined.scheme-medium
    tree
    wget
    xorg.xbacklight
    (callPackage ./modules/wps_office.nix { })
  ];
 
  services = {
    compton = import ./modules/compton/compton.nix {};
  };

  xsession.enable = true;

  programs.git = {
    enable = true;
    userName = "kevinhan0";
    userEmail = "yxh204@nyu.edu";
  };
}
