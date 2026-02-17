{pkgs, ...}: {
  hardware.steam-hardware.enable = true;
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
    libsndfile
    gamescope
  ];
}
