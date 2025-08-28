{ pkgs, ... }: {
environment.systemPackages = with pkgs; [
    neovim
    kitty
    git
    brave
  ];
}
