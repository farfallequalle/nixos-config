{ pkgs, ...}: {
  home.packages = with pkgs; [ 
    ripgrep
    vesktop
    pavucontrol
    telegram-desktop
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    ];
    }
