{ pkgs, ... }:
{
  hardware.steam-hardware.enable = true;
  programs.steam = {
    enable = true;
  };

  # OpenGL and Vulkan configuration
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
  ];

  # Add system packages for VR support
  environment.systemPackages = with pkgs; [
    usbutils
    pkgs.libsndfile
    pkgs.xwayland
    gamescope
  ];
}
