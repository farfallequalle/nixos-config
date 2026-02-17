{pkgs, ...}: {
  home.packages = with pkgs; [
    whatsapp-electron
    telegram-desktop
    claude-code
    seafile-client
    obsidian
    mate.caja
    nerd-fonts.jetbrains-mono
    inter
    noto-fonts
    ani-cli
    pywalfox-native
  ];
}
