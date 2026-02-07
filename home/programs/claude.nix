{...}: {
  home.file.".claude/settings.json".text = builtins.toJSON {
    permissions = {
      allow = [
        "Read"
        "WebFetch"
        "Bash(cat:*)"
        "Bash(cd:*)"
        "Bash(ls:*)"
        "Bash(find:*)"
        "Bash(grep:*)"
        "Bash(rg:*)"
        "Bash(head:*)"
        "Bash(tail:*)"
        "Bash(wc:*)"
        "Bash(diff:*)"
        "Bash(git log:*)"
        "Bash(git status)"
        "Bash(git diff:*)"
        "Bash(git show:*)"
      ];
      deny = [
        "Bash(rm -rf /*)"
      ];
    };
  };
}
