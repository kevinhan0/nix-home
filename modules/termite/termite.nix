{ pkgs, ... }:

{
  programs.termite = {
    enable = true;
    font = "FiraCode Nerd Font 10";
    cursorShape = "ibeam";
    colorsExtra = import ./one-dark-transparent.theme;
  };
}
