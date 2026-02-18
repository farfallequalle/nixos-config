{
  config,
  pkgs,
  hostname,
  ...
}: {
  home.username = "farfallequalle";
  home.homeDirectory = "/home/farfallequalle";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  imports = [
    ./packages.nix
    ../../home/niri/default.nix
    ../../home/programs/firefox.nix
    ../../home/programs/ghostty.nix
    ../../home/programs/git.nix
    ../../home/programs/zsh.nix
    ../../home/programs/starship.nix
    ../../home/programs/cli.nix
    ../../home/programs/noctalia.nix
    ../../home/programs/claude.nix
  ];

  xdg.portal.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "caja.desktop";
    };
  };
  programs.nh = {
    enable = true;
    flake = "/home/farfallequalle/nixos-config";
  };

  programs.vesktop.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  programs.zsh.shellAliases = {
    nrs = "git -C ~/nixos-config add . && nh os switch -H ${hostname} && { pkill quickshell; sleep 1; noctalia-shell & disown; }";
    host = "nvim ~/nixos-config/hosts/${hostname}";
    home = "nvim ~/nixos-config/home";
    flake = "nvim ~/nixos-config/flake.nix";
    cfg = "nvim ~/nixos-config .";
  };

  programs.nixvim.nixosFlakePath = "/home/farfallequalle/nixos-config";

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
