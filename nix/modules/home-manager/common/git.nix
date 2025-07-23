{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    userName = "wayneblink";
    userEmail = "darylblink@ymail.com";
    aliases = {
      ci = "commit";
      cia = "commit --amend";
      s = "status";
      st = "status";
      pu = "push";
      rb = "rebase";
      rbi = "rebase -i";
    };
    extraConfig = {
      commit = {
        verbose = true;
      };
      init = {
        defaultBranch = "main";
      };
      log = {
        date = "local";
      };
      branch = {
        sort = "-committerdate";
      };
      rerere = {
        enabled = true;
      };
      help = {
        autocorrect = "prompt";
      };
      diff = {
        algorithm = "histogram";
      };
    };
  };
}
