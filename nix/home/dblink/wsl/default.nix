{ nhModules, ... }:
{
  imports = [
    "${nhModules}/common"
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
