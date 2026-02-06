{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      show-failed-attempts = true;
      indicator-radius = 100;
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      { timeout = 600; command = "niri msg action power-off-monitors"; }
    ];
    events = {
      before-sleep = "${pkgs.swaylock}/bin/swaylock -f";
      after-resume = "niri msg action power-on-monitors";
    };
  };
}
