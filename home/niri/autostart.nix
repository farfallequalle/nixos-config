{...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["noctalia-shell"];}
    {command = ["vesktop"];}
    {command = ["Telegram"];}
    {command = ["zapzap"];}
    {command = ["seafile-applet"];}
    {command = ["obsidian"];}
    {command = ["sh" "-c" "sleep 2 && firefox"];}
  ];
}
