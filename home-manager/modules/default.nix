{ inputs, ... }: {
imports = [
  ./git.nix
  ./lazygit.nix
  ./waybar
  ./wofi.nix
  ./fish.nix
  ./mnw.nix
  inputs.mnw.homeManagerModules.mnw
  ];
}
