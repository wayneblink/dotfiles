{
  inputs,
  hostname,
  nixosModules,
  ...
}:
{
  imports = [
    ./hardware.nix
    "${nixosModules}/common"
  ];

  networking.hostName = hostname;

  system.stateVersion = "25.05";
}
