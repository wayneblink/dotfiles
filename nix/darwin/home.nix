{ config, pkgs, ... }:
{
  imports = [
    ../git.nix
    ../tmux.nix
  ];

  home = {
    homeDirectory = /Users/wayne;
    username = "wayne";
    stateVersion = "24.11";
  };

  home.packages = with pkgs; [
    pkgs.coreutils-full
    pkgs.fzf
    pkgs.ripgrep
    pkgs.gcc
    pkgs.htop
    pkgs.jq
    pkgs.wget
    pkgs.tree
    pkgs.mermaid-cli
    pkgs.fd
    pkgs.nodejs
    pkgs.deno
    pkgs.prettierd
    pkgs.rustfmt
    pkgs.lua-language-server
    pkgs.luarocks
    pkgs.stylua
    pkgs.astro-language-server
    pkgs.typescript
    pkgs.typescript-language-server
    pkgs.basedpyright
    pkgs.gopls
    pkgs.rust-analyzer
  ];

  programs = {
    home-manager.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
    };
    zsh.enable = false;
  };

  home.file = {
    ".config/nvim".source = ../../nvim;
    ".config/ghostty/config".source = ../../ghostty/config;
    ".bashrc".source = ../../.bashrc;
    ".zshrc".source = ../../.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
