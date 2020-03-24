{ config, lib, pkgs, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    numpy
    matplotlib
    scipy
    ipython
    scikitlearn
    nltk
    Keras
    pandas
    black
    lightgbm
    seaborn
    shapely
    jupyter
    jupyterlab
    pyspark
    xgboost
    geopandas
    tensorflow
    gdal
  ];
  python-with-my-packages = python37.withPackages my-python-packages;
in

{
  # Settings
  xsession.enable = true;
  home.stateVersion = "19.09";
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;

  # Modules
  imports = [
    ./modules/i3.nix
    #./modules/mpd.nix
    ./modules/tmux.nix
    ./modules/rofi.nix
    ./modules/polybar.nix
    ./modules/zsh/zsh.nix
    ./modules/termite.nix
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
    brightnessctl
    curl
    docker
    dropbox
    exa
    feh
    firefox
    fontconfig
    htop
    jq
    kubectl
    ncmpcpp
    neofetch
    nix-prefetch-git
    mpd
    python-with-my-packages
    openvpn
    pandoc
    playerctl
    pywal
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
