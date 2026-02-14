{pkgs, ...}: {
  home.packages = with pkgs; [
    zapzap
    telegram-desktop
    claude-code
    seafile-client
    obsidian
    nerd-fonts.jetbrains-mono
    inter
    noto-fonts
  ];
}
