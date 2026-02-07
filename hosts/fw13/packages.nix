{pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    zapzap
    telegram-desktop
    claude-code
    seafile-client
    obsidian
    nerd-fonts.jetbrains-mono
    inter
    noto-fonts
    inputs.hytale-launcher.packages.${pkgs.system}.default
  ];
}
