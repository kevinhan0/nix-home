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
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Root packages
  environment.systemPackages = with pkgs; [ vim zsh ];

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
    # firewall = {
    #   enable = false;
    #   allowedTCPPorts = [ ... ];
    #   allowedUDPPorts = [ ... ];
    # };
  };

  # Services
  services = {
    openssh.enable = true;
    printing.enable = true;
    dbus.packages = [ pkgs.gnome3.dconf ];
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

  # Users
  users.users.kevinhan0 = {
     isNormalUser = true;
     uid = 1000;
     home = "/home/kevinhan0/";
     description = "Kevin Han";
     extraGroups = [ "wheel" "sudo" ]; # Enable ‘sudo’ for the user.
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
      powerline-fonts
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      defaultFonts = {
        monospace = [ "Meslo LG S for Powerline" ];
      };
    };
  };

  # Misc.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
}

