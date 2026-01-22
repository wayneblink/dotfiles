{
  hostname,
  outputs,
  userConfig,
  ...
}:
{
  nixpkgs.hostPlatform = "x86_64-linux";

  wsl = {
    enable = true;
    defaultUser = userConfig.name;
    interop.register = true;
  };

  networking.hostName = hostname;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = false;

  system.stateVersion = "25.05";
}
