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
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/nvim".source = ../nvim;
    ".config/ghostty/config".source = ../ghostty/config;
    ".bashrc".source = ../.bashrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/wayne/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

}
