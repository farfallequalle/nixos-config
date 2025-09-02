{  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /home/farfallequalle/nixos-config";
      flake = "sudo -E nvim /home/farfallequalle/nixos-config/flake.nix";
      c = "clear";
    };
  };
}
