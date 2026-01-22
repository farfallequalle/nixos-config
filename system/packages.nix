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
    pavucontrol
    xwayland
    git
    ffmpeg
    ];
}
