{
  description = "Abhay's NixOS Fleet";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    awww.url = "git+https://codeberg.org/LGFae/awww";
  };

  outputs = { self, nixpkgs, home-manager, awww, ... }@inputs: 
  let
    # Helper to avoid boilerplate for every host configuration
    mkSystem = hostName: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/${hostName} # Automatically resolves to ./hosts/<name>/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.abhay = import ./users/abhay/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  in {
    nixosConfigurations = {
      daredevil   = mkSystem "daredevil";
      #devil       = mkSystem "devil";
      #homelab-one = mkSystem "homelab-one";
      #homelab-two = mkSystem "homelab-two";
      #old-devil   = mkSystem "old-devil";
    };
  };
} 
