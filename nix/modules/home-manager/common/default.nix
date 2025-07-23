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
    ./git.nix
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
      astro-language-server
      basedpyright
      dhall-lsp-server
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
      vlc
      wl-clipboard
    ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    # TODO break out into module
    helix = {
      enable = true;
      settings = {
        theme = "tokyonight_transparent";
        editor = {
          color-modes = true;
          cursorline = true;
          idle-timeout = 10;
          statusline.mode = {
            insert = "INSERT";
            normal = "NORMAL";
            select = "SELECT";
          };
          indent-guides = {
            character = "|";
            render = true;
          };
        };
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".js" ];
          };
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".ts" ];
          };
        }
        {
          name = "jsx";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".jsx" ];
          };
        }
        {
          name = "tsx";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".tsx" ];
          };
        }
        {
          name = "json";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".json" ];
          };
        }
        {
          name = "markdown";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".md" ];
          };
        }
        {
          name = "html";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".html" ];
          };
        }
        {
          name = "css";
          auto-format = true;
          formatter = {
            command = "prettierd";
            args = [ ".css" ];
          };
        }
      ];
      themes = {
        tokyonight_transparent = {
          "inherits" = "tokyonight";
          "ui.background" = { };
        };
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    jujutsu = {
      enable = true;
      settings = {
        user.name = "${userConfig.username}";
        user.email = "${userConfig.email}";
      };
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
      };
    };
  };

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
