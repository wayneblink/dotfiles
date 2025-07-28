{
  pkgs,
  config,
  userConfig,
  ...
}:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = "${userConfig.username}";
      user.email = "${userConfig.email}";
    };
  };
}
