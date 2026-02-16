{lib, ...}: {
  programs.niri.settings.workspaces = lib.mkForce {
    "1-main" = {
      name = "main";
      open-on-output = "DP-3";
    };
    "2-notes" = {
      name = "notes";
      open-on-output = "DP-3";
    };
    "3-social" = {
      name = "social";
      open-on-output = "HDMI-A-1";
    };
  };
}
