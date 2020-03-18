{ pkgs, ... }:

{

  #programs.alacritty = {
  #  enable = true;
  #  settings = {
  #    font = {
  #      family = "Meslo LG S";
  #      style = "Regular";
  #      font = 8.0;
  #    };
  #  };
  #};
  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile = {
    "alacritty/alacritty.yml".source = ./alacritty.yml;
  };
}
