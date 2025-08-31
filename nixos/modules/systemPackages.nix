{ pkgs, ... }: {
environment.systemPackages = with pkgs; [
    neovim
    kitty
    git
    brave
  ];

nixpkgs.config.allowUnfree = true;

}
