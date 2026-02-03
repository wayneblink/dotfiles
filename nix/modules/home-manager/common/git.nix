{ pkgs, config, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "wayneblink";
        email = "darylblink@ymail.com";
      };
      alias = {
        ci = "commit";
        cia = "commit --amend";
        s = "status";
        st = "status";
        pu = "push";
        rb = "rebase";
        rbi = "rebase -i";
      };
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
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
