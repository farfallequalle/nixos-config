{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    mnw.url = "github:Gerg-L/mnw";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    mnw,
    ...
  }: {
    nixosConfigurations = {
      fw13 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix
	  ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
	    home-manager.users.farfallequalle = import ./home-manager/home.nix;
          }
          (
            {
              config,
              pkgs,
              ...
            }: {
              environment.systemPackages = with pkgs; [
                fish
                wget
                swaybg
                pavucontrol
                brightnessctl
                kitty
                bluetui
                vesktop
                git
              ];
            }
          )
        ];
      };
    };
  };
}
