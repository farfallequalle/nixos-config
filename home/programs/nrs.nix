{ pkgs, hostname, ... }: {
  home.packages = [
    (pkgs.writeShellScriptBin "nrs" ''
      RED='\033[0;31m'
      GREEN='\033[0;32m'
      BOLD='\033[1m'
      NC='\033[0m'

      git -C ~/nixos-config add .

      if nh os switch -H ${hostname}; then
        printf "''${GREEN}''${BOLD}Switch successful.''${NC}\n"
        pkill quickshell 2>/dev/null
        sleep 1
        setsid noctalia-shell &>/dev/null &
      else
        printf "''${RED}''${BOLD}Switch failed.''${NC}\n"
        printf "To rollback: ''${BOLD}sudo nixos-rebuild switch --rollback''${NC}\n"
        exit 1
      fi
    '')
  ];
}
