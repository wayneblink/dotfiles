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
      dhall-lsp-server
      fnlfmt
      fennel-ls
      gopls
      lua-language-server
      luarocks
      nixfmt-rfc-style
      prettierd
      rust-analyzer
      rustfmt
      stylua
      typescript
      typescript-language-server
    ]
    ++ lib.optionals stdenv.isDarwin [ ]
    ++ lib.optionals (!stdenv.isDarwin) [
      chromium
      firefox
      ghostty
      # ((ffmpeg-full.override { withUnfree = true; withOpengl = true; }).overrideAttrs (_: { doCheck = false; }))
      legcord
      mitscheme
      vlc
      wl-clipboard
    ];

  home.file = {
    ".config/nvim".source = ../../../../nvim;
    ".config/ghostty/config".source = ../../../../ghostty/config;
    ".bashrc".source = ../../../../.bashrc;
    ".bash_profile".source = ../../../../.bash_profile;
    ".zshrc".source = ../../../../.zshrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
