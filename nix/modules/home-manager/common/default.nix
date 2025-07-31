{
  outputs,
  userConfig,
  pkgs,
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
      mermaid-cli
      fd
      starship
      nodejs
      lua51Packages.fennel
      astro-language-server
      basedpyright
      black
      dhall-lsp-server
      fnlfmt
      fennel-ls
      gopls
      lua-language-server
      luarocks
      nixfmt-rfc-style
      prettierd
      ruff
      rust-analyzer
      rustfmt
      stylua
      typescript
      typescript-language-server
    ]
    ++ lib.optionals stdenv.isDarwin [ ]
    ++ lib.optionals (!stdenv.isDarwin) [
      chromium
      # ((ffmpeg-full.override { withUnfree = true; withOpengl = true; }).overrideAttrs (_: { doCheck = false; }))
      firefox
      ghostty
      kitty
      legcord
      mitscheme
      vlc
      wl-clipboard
    ];

  home.file = {
    ".bashrc".source = ../../../../.bashrc;
    ".bash_profile".source = ../../../../.bash_profile;
    ".config/ghostty/config".source = ../../../../ghostty/config;
    ".config/nvim".source = ../../../../nvim;
    ".config/kitty/kitty.conf".source = ../../../../kitty.conf;
    ".zshrc".source = ../../../../.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
