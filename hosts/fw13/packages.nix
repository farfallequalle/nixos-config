{pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    zapzap
    telegram-desktop
    claude-code
    cliphist
    swww
    seafile-client
    obsidian
    inputs.hytale-launcher.packages.${pkgs.system}.default
  ];
}
