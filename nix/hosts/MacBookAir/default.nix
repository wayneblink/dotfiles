{
  pkgs,
  outputs,
  userConfig,
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

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    optimise.automatic = true;
    package = pkgs.nix;
  };

  users.users.${userConfig.name} = {
    name = "${userConfig.name}";
    home = "/Users/${userConfig.name}";
  };

  system = {
    defaults = {
      dock = {
        autohide = true;
        show-recents = true;
        static-only = true;
        tilesize = 44;
        autohide-delay = 0.0;
        expose-animation-duration = 0.15;
      };
      trackpad.Clicking = true;
      finder.FXPreferredViewStyle = "clmv";
      loginwindow.GuestEnabled = false;
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        KeyRepeat = 2;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    primaryUser = "${userConfig.name}";
    startup.chime = false;
  };

  homebrew = {
    enable = true;
    casks = with pkgs; [
      "chromium"
      "firefox"
      "ghostty"
      "legcord"
      "rectangle"
      "vlc"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing
  system.stateVersion = 6;
}
