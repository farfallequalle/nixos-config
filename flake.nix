{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    nur.url = "github:nix-community/NUR";
    claude-code.url = "github:sadjow/claude-code-nix";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, niri, nur, claude-code, stylix, ... }@inputs: {
    nixosConfigurations.fw13 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit self inputs; };
      modules = [
        ./hosts/fw13/configuration.nix
      ];
    };
  };
}
