{config, pkgs, ...}: {
  programs.niri.settings = {
    input.touchpad = {
      click-method = "button-areas";
      dwt = true;
      dwtp = true;
      natural-scroll = true;
      scroll-method = "two-finger";
      tap = true;
      tap-button-map = "left-right-middle";
      middle-emulation = true;
      accel-profile = "adaptive";
    };

    binds = with config.lib.niri.actions; let
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
    in {
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action = spawn brightnessctl ["set" "10%+"];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action = spawn brightnessctl ["set" "10%-"];
      };
    };
  };
}
