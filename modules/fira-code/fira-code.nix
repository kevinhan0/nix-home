{ config, lib, pkgs, ... }: 

let
  inherit (pkgs) stdenv;
in
  stdenv.mkDerivation rec {
    name = "FiraCode-nerdfont-2.1.0";
    src = ./fonts;
    dontBuild = true;

    installPhase = ''
      FONT_DIR="$out/share/fonts"
      TTF_DIR="$FONT_DIR/truetype"
      OTF_DIR="$FONT_DIR/opentype"
      mkdir -p $FONT_DIR
      cd $src
      if test -n "$(find $src -maxdepth 1 -name '*.tt*' -print -quit)"; then
       mkdir -p $TTF_DIR
       cp *.tt* $TTF_DIR
      fi
      if test -n "$(find $src -maxdepth 1 -name '*.otf' -print -quit)"; then
      mkdir -p $OTF_DIR
      cp *.otf $OTF_DIR
      fi
    '';
  }
