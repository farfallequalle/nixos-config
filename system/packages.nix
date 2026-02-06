{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    ripgrep
    pulseaudio
    pavucontrol
    xwayland
    xwayland-satellite # required for X11 apps (Steam etc.) on Niri — provides the X11 socket
    ffmpeg
    ];
}
