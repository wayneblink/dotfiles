{ config, pkgs, ... }:

{
  home.username = "wayne";
  home.homeDirectory = "/home/wayne";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./git.nix
    ./tmux.nix
  ];

  home.packages = [
    pkgs.fzf
    pkgs.ripgrep
    pkgs.gcc
    pkgs.htop
    pkgs.jq
    pkgs.wget
    pkgs.tree
    pkgs.mermaid-cli
    pkgs.fd
    pkgs.firefox
    pkgs.chromium
    ((pkgs.ffmpeg-full.override { withUnfree = true; withOpengl = true; }).overrideAttrs (_: { doCheck = false; }))
    pkgs.vlc
    pkgs.ghostty
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
  };

  home.file = {
    ".config/nvim".source = ../nvim;
    ".config/ghostty/config".source = ../ghostty/config;
    ".bashrc".source = ../.bashrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #  /etc/profiles/per-user/wayne/etc/profile.d/hm-session-vars.sh
}
