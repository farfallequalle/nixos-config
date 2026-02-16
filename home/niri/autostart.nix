{...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["noctalia-shell"];}
    {command = ["vesktop"];}
    {command = ["Telegram"];}
    {command = ["sh" "-c" "unset NIXOS_OZONE_WL; exec whatsapp-electron"];}
    {command = ["seafile-applet"];}
    {command = ["obsidian"];}
    {command = ["sh" "-c" "sleep 2 && firefox"];}
  ];
}
