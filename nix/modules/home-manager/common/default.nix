{
  config,
  outputs,
  userConfig,
  pkgs,
  isWSL,
  ...
}:
{
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
      if pkgs.stdenv.isDarwin then "/Users/${userConfig.name}" else "/home/${userConfig.name}";
  };

  imports = [
    ./direnv.nix
    ./git.nix
    ./helix.nix
    ./jujutsu.nix
    ./neovim.nix
    ./starship.nix
    ./tmux.nix
  ];

  home.packages =
    with pkgs;
    [
      coreutils-full
      fzf
      ripgrep
      gcc
      htop
      jq
      lf
      wget
      tree
      fd
      starship
      kubectl
      mermaid-cli
      nodejs
      dotnetCorePackages.sdk_10_0-bin
      lua51Packages.fennel
      angular-language-server
      astro-language-server
      basedpyright
      black
      dhall-lsp-server
      fnlfmt
      fennel-ls
      gopls
      lua-language-server
      luarocks
      nixd
      nixfmt-rfc-style
      prettierd
      # roslyn-ls
      ruff
      rust-analyzer
      rustfmt
      stylua
      typescript
      typescript-language-server
      vtsls
      vue-language-server
      zls
    ]
    ++ lib.optionals stdenv.isDarwin [ ]
    ++ lib.optionals (!stdenv.isDarwin && !isWSL) [
      # ((ffmpeg-full.override { withUnfree = true; withOpengl = true; }).overrideAttrs (_: { doCheck = false; }))
      firefox
      ghostty
      jetbrains.idea-community-bin
      keyd
      kitty
      legcord
      mitscheme
      ungoogled-chromium
      vlc
      vscode
      wl-clipboard
      xfce.thunar
      zeal
    ];

  home.file = {
    ".aerospace.toml".source = ../../../../.aerospace.toml;
    ".bashrc".source = ../../../../.bashrc;
    ".bash_profile".source = ../../../../.bash_profile;
    ".config/ghostty/config".source = ../../../../ghostty/config;
    ".config/kitty/kitty.conf".source = ../../../../kitty.conf;
    ".zshrc".source = ../../../../.zshrc;
    ".config/nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
    ".config/hypr/hyprland.conf".source = ../../../../hypr/hyprland.conf;
    ".ideavimrc".source = ../../../../.ideavimrc;
    ".config/waybar/config.jsonc".source = ../../../../waybar/config.jsonc;
    ".config/waybar/style.css".source = ../../../../waybar/style.css;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
