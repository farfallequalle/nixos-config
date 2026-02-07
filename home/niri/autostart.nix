{...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["noctalia-shell"];}
    {command = ["vesktop"];}
    {command = ["Telegram"];}
    {command = ["zapzap"];}
    {command = ["obsidian"];}
    {command = ["sh" "-c" "sleep 2 && firefox"];}
  ];
}
