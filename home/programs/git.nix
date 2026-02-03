{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "vaultgoblin64";
      user.email = "141916717+vaultgoblin64@users.noreply.github.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.autocrlf = "input";
    };
  };
}
