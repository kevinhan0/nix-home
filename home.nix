{ config, lib, pkgs, ... }:

{
  # Settings
  xsession.enable = true;
  home.stateVersion = "19.09";
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;

  # Modules
  imports = [
    ./modules/i3.nix
    ./modules/tmux.nix
    ./modules/rofi.nix
    ./modules/polybar.nix
    ./modules/termite.nix
    ./modules/zsh/zsh.nix
    ./modules/neovim/neovim.nix
  ];

  # Services
  services = {
    compton = import ./modules/compton/compton.nix {};
  };

  # Themes
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

  # Packages
  home.packages = with pkgs; [
    bat
    conky
    curl
    docker
    dropbox
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
    mpd
    openvpn
    pandoc
    powerline-fonts
    spotify
    texlive.combined.scheme-medium
    tree
    unzip
    wget
    (callPackage ./modules/wps_office.nix { })
    (callPackage ./modules/fira-code/fira-code.nix { })
  ];

  programs.git = {
    enable = true;
    userName = "kevinhan0";
    userEmail = "yxh204@nyu.edu";
  };
}
