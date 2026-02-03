{ config, pkgs, inputs, self, ... }:

let
    allPackages = import ./packages.nix { inherit pkgs; };
in
{
  home.username = "farfallequalle";
  home.homeDirectory = "/home/farfallequalle";

  imports = [
    ../../home/niri/default.nix
    ../../home/programs/firefox.nix
    ../../home/programs/ghostty.nix
    ../../home/programs/wlsunset.nix
    ../../home/programs/git.nix
    ../../home/programs/stylix.nix
  ];

  home.packages = allPackages;

  xdg.portal.enable = true;
  # goated:
  programs.nh.enable = true;

  programs.vesktop.enable = true;

  stylix.targets = {
    vesktop.enable = true;
    bat.enable = true;
    ghostty.enable = true;
    fzf.enable = true;
    neovim.enable = true;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.bat = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initContent = ''
      source ${../../home/programs/p10k.zsh}
    '';
    shellAliases = {
      nrs = "git -C ~/nixos-config add . && nh os switch ~/nixos-config -H fw13";
      host = "nvim ~/nixos-config/hosts/fw13";
      home = "nvim ~/nixos-config/home";
      flake = "nvim ~/nixos-config/flake.nix";
      cat = "bat";
      ls = "eza";
      ll = "eza -la";
      tree = "eza --tree";
    };
  };

  home.activation.setWallpaper = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    export WAYLAND_DISPLAY=''${WAYLAND_DISPLAY:-wayland-1}
    ${pkgs.swww}/bin/swww img ${config.stylix.image} 2>/dev/null || true
  '';

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

}
