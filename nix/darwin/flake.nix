{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew }:
  let
    configuration = { pkgs, inputs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
      ];

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

      system.defaults = {
        dock = {
          autohide = true;
          show-recents = true;
          static-only = true;
          tilesize = 44;
          autohide-delay = 0.0;
          expose-animation-duration = 0.2;
        };
        trackpad.Clicking = true;
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled = false;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
      };
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;
      system.startup.chime = false;

      users.users.wayne = {
        name = "wayne";
        home = /Users/wayne;
        description = "Wayne Blink";
        packages = with pkgs; [];
        shell = pkgs.bash;
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
      nix.enable = false;
      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;
      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#smol-2
    darwinConfigurations."smol-2" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit inputs; };
      modules = [
        configuration
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.wayne = import ./home.nix;
        }
        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "wayne";
          };
        }
      ];
    };
  };
}
