{pkgs, ...}: {
  home.packages = with pkgs; [
    whatsapp-electron
    telegram-desktop
    claude-code
    seafile-client
    obsidian
    nerd-fonts.jetbrains-mono
    inter
    noto-fonts
  ];
}
