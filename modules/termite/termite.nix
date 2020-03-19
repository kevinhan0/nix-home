{ pkgs, ... }:

{
  programs.termite = {
    enable = true;
    font = "FiraCode Nerd Font 10";
    cursorShape = "ibeam";
    backgroundColor = "#282c34";
    foregroundColor = "#abb2bf";
    foregroundBoldColor = "#abb2bf";
    colorsExtra = ''
      # black
      color0  = #282c34
      color8  = #5c6370

      # red
      color1  = #e06c75
      color9  = #be5046

      # green
      color2  = #98c379
      color10 = #7a9f60

      # yellow
      color3  = #e5c07b
      color11 = #d19a66

      # blue
      color4  = #61afef
      color12 = #3b84c0

      # magenta
      color5  = #c678dd
      color13 = #9a52af

      # cyan
      color6  = #56b6c2
      color14 = #3c909b

      # white
      color7  = #abb2bf
      color15 = #828997
    '';
  };
}
