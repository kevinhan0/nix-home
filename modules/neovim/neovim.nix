{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
	vimAlias = true;
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [ black ]);
    extraConfig = import ./init.vim;
    plugins = let
      onedark = pkgs.vimUtils.buildVimPlugin {
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
      #black
      indentLine
      auto-pairs
      nerdcommenter

      # Documentation
      vim-polyglot
      #vim-manpager

      # Python
      tslime-vim
      vimpyter

      # Terminal
      #split-term-vim
      vim-gitgutter

      # Themes
      onedark
      wal-vim

      # Highlighting
      ale
      coc-nvim
      coc-git
      coc-json
      coc-html
      coc-yaml
      coc-python
      vim-nix
    ];
  };
}
