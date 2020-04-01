{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
	vimAlias = true;
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [ black jupyter ]);
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
          rev = "9ed2542e938c327a53c17f8932ee5fc53776ba31";
          sha256 = "0iyq1l4ynwniya1fdjq1846m6m5zrd5yz9jjzi4xsja0djbh57ci";
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
      jupyter-vim = pkgs.vimUtils.buildVimPlugin {
        name = "jupyter-vim";
        src = pkgs.fetchFromGitHub {
          owner = "jupyter-vim";
          repo = "jupyter-vim";
          rev = "5e6b8c8e027b6a504e54ed03db9f4d915d74ce8d";
          sha256 = "16szppdjlcynq2kwkiqg5h119mixna0n1wlsslpxcvz6wjz91jvd";
        };
      };
      markdown-preview-vim = pkgs.vimUtils.buildVimPlugin {
        name = "markdown-preview.vim";
        src = pkgs.fetchFromGitHub {
          owner = "iamcco";
          repo = "markdown-preview.vim";
          rev = "97388dc537454a90422f186cb4e1a4f9a3f95122";
          sha256 = "13s1jrny0dll0hnn2an378xny84yni08q5lvnb0xx111s1q79fhn";
        };
      };
      split-term-vim = pkgs.vimUtils.buildVimPlugin {
        name = "split-term.vim";
        src = pkgs.fetchFromGitHub {
          owner = "vimlab";
          repo = "split-term.vim";
          rev = "a4e28cab77ad07fc8a0ebb62a982768c02eb287c";
          sha256 = "12vrmbq1r8d6sgyxjwi0s856n1v4vjhrf8wpwq6l4ydmk1bnvjkb";
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
      markdown-preview-vim

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
      vim-nix
      indentLine
      auto-pairs
      nerdcommenter

      # Documentation
      vim-polyglot
      #vim-manpager

      # Python
      tslime-vim
      vimpyter
      jupyter-vim

      # Terminal
      #split-term-vim
      vim-gitgutter

      # Themes
      onedark
      vim-one

      # Auto-complete
      ale
      coc-nvim
      coc-git
      coc-json
      coc-html
      coc-yaml
      coc-python
    ];
  };
}
