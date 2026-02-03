{
  description = "nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    opencode.url = "github:anomalyco/opencode";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      darwin,
      nix-homebrew,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      users = {
        wayne = {
          name = "wayne";
          username = "wayneblink";
          email = "darylblink@ymail.com";
        };
        dblink = {
          name = "dblink";
          username = "wayneblink";
          email = "darylblink@ymail.com";
        };
      };

      mkNixosConfiguration =
        hostname: username: isWSL:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              hostname
              isWSL
              ;
            userConfig = users.${username};
            nixosModules = "${self}/modules/nixos";
          };
          modules = [
            ./hosts/${hostname}
          ]
          ++ nixpkgs.lib.optionals isWSL [
            inputs.nixos-wsl.nixosModules.wsl
          ];
        };

      mkHomeConfiguration =
        system: username: hostname: isWSL:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          extraSpecialArgs = {
            inherit inputs outputs isWSL;
            userConfig = users.${username};
            nhModules = "${self}/modules/home-manager";
          };
          modules = [ ./home/${username}/${hostname} ];
        };

      mkDarwinConfiguration =
        hostname: username:
        darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs outputs hostname;
            isWSL = false;
            userConfig = users.${username};
          };
          modules = [
            ./hosts/${hostname}
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = username;
              };
            }
          ];
        };

    in
    {
      nixosConfigurations = {
        dev = mkNixosConfiguration "dev" "wayne" false;
        wsl = mkNixosConfiguration "wsl" "dblink" true;
      };

      darwinConfigurations = {
        MacBookAir = mkDarwinConfiguration "MacBookAir" "wayne";
      };

      homeConfigurations = {
        "wayne@dev" = mkHomeConfiguration "x86_64-linux" "wayne" "dev" false;
        "dblink@wsl" = mkHomeConfiguration "x86_64-linux" "dblink" "wsl" true;
        "wayne@MacBookAir" = mkHomeConfiguration "aarch64-darwin" "wayne" "MacBookAir" false;
      };

      overlays = import ./overlays { inherit inputs; };
    };
}
