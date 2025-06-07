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
    coreutils-full
    fzf
    ripgrep
    gcc
    htop
    jq
    wget
    tree
    mermaid-cli
    fd
    nodejs
    prettierd
    rustfmt
    lua-language-server
    luarocks
    stylua
    astro-language-server
    typescript
    typescript-language-server
    basedpyright
    gopls
    rust-analyzer
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
