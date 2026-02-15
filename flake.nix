{
  description = "NixOS config for fw13 + rig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    nur.url = "github:nix-community/NUR";
    claude-code.url = "github:sadjow/claude-code-nix";
    nixvim-config = {
      url = "github:vaultgoblin64/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-shell = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.fw13 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit self inputs;};
      modules = [
        ./hosts/fw13/configuration.nix
      ];
    };

    nixosConfigurations.rig = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit self inputs;};
      modules = [
        ./hosts/rig/configuration.nix
      ];
    };
  };
}
