{ config, pkgs, ... }:

let
  gui = if pkgs.stdenv.isDarwin then "darwin" else "gtk3";
in
{
  programs.home-manager.enable = true;

  home.stateVersion = "19.09";

  home.packages = with pkgs; [
    exa
    bat
    cmake
    curl
    gcc
    htop
    jq
    neofetch
    nix-prefetch-git
    tree
    wget
  ];

  programs.tmux = {
    enable = true;
    # disableConfirmationPrompt = true;
    extraConfig = import ./tmux.nix;
    # keyMode = "vi";
    # shortcut = "t";
    terminal = "screen-256color";
  };

  nixpkgs.config.vim.gui = gui;

  programs.vim = {
    enable = true;
    extraConfig = import ./vim.nix;
    plugins = let
      colours = pkgs.vimUtils.buildVimPlugin {
        name = "onedark";
        src = pkgs.fetchFromGitHub {
          owner = "joshdick";
          repo = "onedark.vim";
          rev = "caa878801495aaf54e57d214486ef983a429d822";
          sha256 = "0bgfwidrlaqxnjmk14gqc8b0mxh0c5xf098qcjz9mvw236n88xl7";
        };
      };
    in
    with pkgs.vimPlugins; [
      # LaTeX
      vimtex
      vim-latex-live-preview

      # Markdown
      vimwiki
      vim-markdown
      tabular

      # Airline
      vim-airline
      vim-airline-themes

      # NERDTree
      nerdtree
      vim-nerdtree-tabs
      nerdtree-git-plugin
      vim-devicons

      # Focus
      # goyo.vim
      # limelight.vim

      # Syntax
      indentLine
      auto-pairs
      nerdcommenter

      # Documentation
      vim-polyglot
      vim-manpager

      # Python
      # tslime.vim

      # Terminal
      # split-term.vim
      vim-gitgutter

      # Themes
      colours
    ];
  };
}
