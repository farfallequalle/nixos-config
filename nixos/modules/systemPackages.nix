{ pkgs, ... }: {
environment.systemPackages = with pkgs; [
    neovim
    kitty
    git
    firefox
  ];

nixpkgs.config.allowUnfree = true;

}
