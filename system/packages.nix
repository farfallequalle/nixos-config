{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    ripgrep
    pulseaudio
    pavucontrol
    xwayland
    ffmpeg
    ];
}
