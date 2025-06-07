{ 
  outputs, 
  userConfig, 
  pkgs,
  ... 
}: {
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  systemd.user.startServices = "sd-switch";

  home = {
    username = "${userConfig.name}";
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then "/Users/${userConfig.name}"
      else "/home/${userConfig.name}";
  };

  imports = [
    ./git.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    fzf
    ripgrep
    gcc
    htop
    jq
    wget
    tree
    mermaid-cli
    fd
    firefox
    chromium
    ((ffmpeg-full.override { withUnfree = true; withOpengl = true; }).overrideAttrs (_: { doCheck = false; }))
    vlc
    ghostty
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

  # TODO
  # home.file = {
  #   ".config/nvim".source = ../../../../../nvim;
  #   ".config/ghostty/config".source = ../../../../../ghostty/config;
  #   ".bashrc".source = ../../../../../.bashrc;
  # };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
