{
  config,
  pkgs,
  ...
}: {
  home.username = "farfallequalle";
  home.homeDirectory = "/home/farfallequalle";

  imports = [
    ./packages.nix
    ../../home/niri/default.nix
    ../../home/programs/firefox.nix
    ../../home/programs/ghostty.nix
    ../../home/programs/git.nix
    ../../home/programs/zsh.nix
    ../../home/programs/cli.nix
    ../../home/nixvim/default.nix
    ../../home/programs/noctalia.nix
    ../../home/programs/claude.nix
  ];

  xdg.portal.enable = true;
  programs.nh = {
    enable = true;
    flake = "/home/farfallequalle/nixos-config";
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  programs.vesktop.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.zsh.shellAliases = {
    nrs = "git -C ~/nixos-config add . && nh os switch -H fw13";
    host = "nvim ~/nixos-config/hosts/fw13";
    home = "nvim ~/nixos-config/home";
    flake = "nvim ~/nixos-config/flake.nix";
    cfg = "nvim ~/nixos-config .";
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
