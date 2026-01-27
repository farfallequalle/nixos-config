{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, home-manager, niri, nur, ... }@inputs: {
    nixosConfigurations.fw13 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self inputs; };
      modules = [ 
        ./hosts/fw13/configuration.nix
	inputs.home-manager.nixosModules.default
        {
          nixpkgs.overlays = [ 
            inputs.niri.overlays.niri 
            inputs.nur.overlays.default
          ];
        }
	];
    };
  };
}
