{inputs, ...}:

{
  imports = [
    inputs.niri.homeModules.niri # Import Niri's home-manager module
    ./settings.nix
    ./keybinds.nix
    ./rules.nix
    ./autostart.nix
  ];
}
