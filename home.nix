{ config, pkgs, ... }:

let
  NIX_PATH = "~/.nix-profile/etc/profile.d/nix.sh";
  sourceFile = file: "[ -f ${file} ] && source ${file}";
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
    #gcc
    git
    htop
    jq
    neofetch
    nix-prefetch-git
    starship
    tmux
    tree
    wget
    zsh
  ];

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    history = {
      path = "~/.zsh_history";
      size = 50000;
      save = 50000;
    };
    shellAliases = import ./aliases.nix;
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.3";
          sha256 = "1h8h2mz9wpjpymgl2p7pc146c1jgb3dggpvzwm9ln3in336wl95c";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
          sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
        };
      }
    ];
    sessionVariables = rec {
      EDITOR = "vim";
      VISUAL = EDITOR;
      GIT_EDITOR = EDITOR;
    };
    initExtra = ''
      ${sourceFile NIX_PATH}
      neofetch
    '';
  };


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
