{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;
    shellAliases = {
      cat = "bat";
      ls = "eza";
      ll = "eza -la";
      tree = "eza --tree";
      cc = "cd ~/nixos-config && claude -c";
      ccd = "cd ~/nixos-config && claude -c --dangerously-skip-permissions";
    };
  };
}
