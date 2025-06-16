{
  description = "nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    darwin,
    ...
  }@ inputs: let
  inherit (self) outputs;

  users = {
    wayne = {
      name = "wayne";
      username = "wayneblink";
      email = "darylblink@ymail.com";
    };
  };

  mkNixosConfiguration = hostname: username:
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs outputs hostname;
        userConfig = users.${username};
        nixosModules = "${self}/modules/nixos";
      };
      modules = [ ./hosts/${hostname} ];
    };

  mkHomeConfiguration = system: username: hostname:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; };
      extraSpecialArgs = {
        inherit inputs outputs;
        userConfig = users.${username};
        nhModules = "${self}/modules/home-manager";
      };
      modules = [ ./home/${username}/${hostname} ];
    };

  mkDarwinConfiguration = hostname: username:
    darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        inherit inputs outputs hostname;
        userConfig = users.${username};
      };
      modules = [
        ./hosts/${hostname}
        home-manager.darwinModules.home-manager
      ];
    };

  in {
    nixosConfigurations = {
      dev = mkNixosConfiguration "dev" "wayne";
    };

    darwinConfigurations = {
      MacBookAir = mkDarwinConfiguration "MacBookAir" "wayne";
    };

    homeConfigurations = {
      "wayne@dev" = mkHomeConfiguration "x86_64-linux" "wayne" "dev";
    };

    overlays = import ./overlays { inherit inputs; };
  };
}
