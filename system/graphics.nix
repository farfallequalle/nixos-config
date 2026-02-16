{pkgs, ...}: {
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
  ];
}
