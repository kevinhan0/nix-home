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
    docker
    gcc
    git
    htop
    jq
    kubectl
    #lua.pkgs.luv.libluv
    neofetch
    nix-prefetch-git
    pandoc
    texlive.combined.scheme-full
    starship
    tmux
    tree
    #vim
    wget
    zsh
  ];

  #programs.neovim = {
  #  enable = true;
  #};

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

  programs.neovim = {
    enable = true;
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [ black notedown ]);
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
      tex-conceal-vim = pkgs.vimUtils.buildVimPlugin {
        name = "tex-conceal-vim";
        src = pkgs.fetchFromGitHub {
          owner = "KeitaNakamura";
          repo = "tex-conceal.vim";
          rev = "801af0d86035556f5d39aedd56d4206deed683e0";
          sha256 = "0j7gfcgxdnw1p5n5nafxq8a5yj7y604jslw923xjzy6lqd6riwcl";
        };
      };
      vim-nerdtree-syntax-highlight = pkgs.vimUtils.buildVimPlugin {
        name = "vim-nerdtree-syntax-highlight";
        src = pkgs.fetchFromGitHub {
          owner = "tiagofumo";
          repo = "vim-nerdtree-syntax-highlight";
          rev = "43770536bad0474de7e132e2df9cc7785c1f8e14";
          sha256 = "0bvnwq122chicsm5x4yc4kqn4cnxdchcsx1kj66wih056djfxi7r";
        };
      };
      black = pkgs.vimUtils.buildVimPlugin {
        name = "black";
        src = pkgs.fetchFromGitHub {
          owner = "psf";
          repo = "black";
          rev = "5b552fab9d8820db22d6266a8702b0f24e4c7ed9";
          sha256 = "0wlbv50xwdmj8s54pbbffka6sb7rg3mmkz8z00vbv39bxk11hq9p";
        };
      };
      vimpyter = pkgs.vimUtils.buildVimPlugin {
        name = "vimpyter";
        src = pkgs.fetchFromGitHub {
          owner = "szymonmaszke";
          repo = "vimpyter";
          rev = "25a0acbe81d445ece0df78cb23e2d5011df1b63a";
          sha256 = "0kwf8ls5nar8wa36lfrbm3ysryim2pcz9ywv18rjqfp7wacz683c";
        };
      };
    in
    with pkgs.vimPlugins; [
      # LaTeX
      vimtex
      tex-conceal-vim
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
      vim-nerdtree-syntax-highlight

      # Focus
      goyo
      limelight-vim

      # Syntax
      black
      indentLine
      auto-pairs
      nerdcommenter

      # Documentation
      vim-polyglot
      vim-manpager

      # Python
      tslime-vim
      vimpyter

      # Terminal
      split-term-vim
      vim-gitgutter

      # Themes
      colours
    ];
  }
}
