{ config, pkgs, ... }:

{
  # Hardware
  imports =
    [
      ./hardware-configuration.nix
    ];
  sound.enable = true;
  hardware = {
    bluetooth.enable = false;
    facetimehd.enable = false;
    pulseaudio.enable = true;
    brightnessctl.enable = true;
    opengl.extraPackages = [ pkgs.vaapiIntel ];
  };

  # System settings
  system.stateVersion = "19.09";
  time.timeZone = "Asia/Shanghai";

  # Boot
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Internationalisation properties.
  i18n = {
    inputMethod.enabled = "fcitx";
    inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ cloudpinyin ];
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
  };

  # Root packages
  environment.systemPackages = with pkgs; [
    fcitx
    fcitx-configtool
    font-manager
    gnome3.nautilus
    nodejs
    mpd
    vim
    zsh
];

  # Networking
  networking = {
    useDHCP = false;
    interfaces.enp0s20u2.useDHCP = true;
    interfaces.wlp2s0b1.useDHCP = true;
    # hostName = "nixos";
    # wireless.enable = true;
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 6600 17500 ];
      allowedUDPPorts = [ 6600 17500 ];
    };
  };

  # Services
  services = {
    gnome3.core-utilities.enable = false;
    openssh.enable = true;
    printing.enable = true;
    dbus.packages = [ pkgs.gnome3.dconf ];
    upower.enable = config.powerManagement.enable;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "mac";
      xkbOptions = "caps:escape";
      libinput.enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;
      windowManager.i3.enable = true;
    };
  };

  # Dropbox
  #systemd.user.services.dropbox = {
  #  description = "Dropbox";
  #  wantedBy = [ "graphical-session.target" ];
  #  environment = {
  #    QT_PLUGIN_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtPluginPrefix;
  #    QML2_IMPORT_PATH = "/run/current-system/sw/" + pkgs.qt5.qtbase.qtQmlPrefix;
  #  };
  #  serviceConfig = {
  #    ExecStart = "${pkgs.dropbox.out}/bin/dropbox";
  #    ExecReload = "${pkgs.coreutils.out}/bin/kill -HUP $MAINPID";
  #    KillMode = "control-group"; # upstream recommends process
  #    Restart = "on-failure";
  #    PrivateTmp = true;
  #    ProtectSystem = "full";
  #    Nice = 10;
  #  };
  #};

  # Users
  users.users.kevinhan0 = {
    isNormalUser = true;
    uid = 1000;
    home = "/home/kevinhan0/";
    description = "Kevin Han";
    extraGroups = [ "wheel" "sudo" "video" "audio" "networkmanager" "input" ];
    password = "136bdod6";
  };

  # Nix
  nix = {
    binaryCaches = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
    trustedBinaryCaches = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    ];
    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = true
    '';
    buildMachines = [{
      hostName = "builder";
      system = "x86_64-linux";
      maxJobs = 2;
      speedFactor = 2;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      mandatoryFeatures = [ ];
    }];
  };
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      ubuntu_font_family
      powerline-fonts
      wqy_microhei
      wqy_zenhei
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      #penultimate.enable = true;
      #defaultFonts = {
      #  serif = [ "Ubuntu" ];
      #  sansSerif = [ "Ubuntu" ];
      #  monospace = [ "Ubuntu" ];
      #};
    };
  };

  # Misc.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
}

