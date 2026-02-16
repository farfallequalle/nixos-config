{pkgs, ...}: {
  hardware.steam-hardware.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
    libsndfile
    gamescope
  ];
}
