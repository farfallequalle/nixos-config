{pkgs, ...}: {
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
      source ${./p10k.zsh}
    '';
    shellAliases = {
      cat = "bat";
      ls = "eza";
      ll = "eza -la";
      tree = "eza --tree";
    };
  };
}
