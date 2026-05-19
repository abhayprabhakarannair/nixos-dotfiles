{
  description = "Abhay's NixOS Fleet";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, disko, home-manager, nvf, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable {
         inherit system;
         config.allowUnfree = true;
    };

    mkSystem = hostName: nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs pkgs-unstable; };

      modules = [
        disko.nixosModules.disko
	nvf.nixosModules.default
        ./hosts/${hostName}
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
	    extraSpecialArgs = { inherit inputs pkgs-unstable; };
            users.abhay = import ./users/abhay/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  in {
    nixosConfigurations = {
      daredevil   = mkSystem "daredevil";
      devil   = mkSystem "devil";
    };
  };
} 
