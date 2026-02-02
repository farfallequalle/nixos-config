{ pkgs, ... }:
# to be verified
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
    openvr # Required for SteamVR
    libusb1 # Used for VR devices
    usbutils
    pkgs.libsndfile
    pkgs.xwayland
    gamescope
  ];

  # Udev rules for VR devices
  services.udev.packages = with pkgs; [
    openvr
  ];

  services.udev.extraRules = ''
    # HTC Vive
    SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", ATTR{idProduct}=="2c87", MODE="0666", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTR{idVendor}=="28de", ATTR{idProduct}=="2101", MODE="0666", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTR{idVendor}=="28de", ATTR{idProduct}=="2000", MODE="0666", GROUP="plugdev"
  '';
}
