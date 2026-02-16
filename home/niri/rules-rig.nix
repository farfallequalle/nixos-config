{...}: {
  programs.niri.settings.window-rules = [
    {
      matches = [
        {app-id = "vesktop";}
        {app-id = "org.telegram.desktop";}
        {app-id = "whatsapp-electron";}
      ];
      open-on-workspace = "social";
      open-focused = false;
    }
  ];
}
