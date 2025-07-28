{ pkgs, config, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox_transparent";
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
      gruvbox_transparent = {
        "inherits" = "gruvbox_dark_hard";
        "ui.background" = { };
      };
    };
  };

}
