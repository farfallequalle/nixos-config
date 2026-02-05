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
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 200;

      format = ''
        󱄅 $directory$git_branch$git_commit$git_state$git_status$cmd_duration$line_break$status$character'';

      directory = {
        read_only = " ";
        truncation_length = 5;
        truncation_symbol = "…/";
        style = "blue bold";
      };

      git_branch = {
        symbol = "󰘬 ";
        style = "cyan";
      };

      git_commit = {
        tag_disabled = false;
      };

      git_status = {
        style = "yellow";
        format = "[$all_status$ahead_behind]($style) ";
        conflicted = " ";
        ahead = "⇡";
        behind = "⇣";
        diverged = "⇕";
        untracked = "?";
        stashed = " ";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
      };

      cmd_duration = {
        min_time = 5000;
        style = "yellow";
        format = "[$duration]($style) ";
      };

      status = {
        symbol = "🔴 ";
        disabled = false;
      };

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };

      nix_shell = {
        symbol = " ";
      };

      package = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };

      golang = {
        symbol = " ";
      };

      nodejs = {
        symbol = " ";
      };

      lua = {
        symbol = " ";
      };

      docker_context = {
        symbol = " ";
      };
    };
  };
}
