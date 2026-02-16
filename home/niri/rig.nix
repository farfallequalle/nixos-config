{pkgs, ...}: let
  stack-social = import ./scripts/stack-social.nix {inherit pkgs;};
in {
  imports = [
    ./outputs-rig.nix
    ./workspaces-rig.nix
    ./rules-rig.nix
  ];

  programs.niri.settings.spawn-at-startup = [
    {command = ["${pkgs.swaybg}/bin/swaybg" "-i" "/home/farfallequalle/nixos-config/wallpapers/redlight.jpg" "-m" "fill"];}
    {command = ["steam" "-silent" "-nochatui" "-nofriendsui" "-system-composer"];}
    {command = ["${stack-social}"];}
  ];
}
