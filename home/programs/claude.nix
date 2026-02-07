{...}: {
  home.file.".claude/settings.json".text = builtins.toJSON {
    permissions = {
      allow = [
        "Read"
        "Glob"
        "Grep"
        "WebFetch"
        "WebSearch"
        "Bash(cat:*)"
        "Bash(bat:*)"
        "Bash(ls:*)"
        "Bash(tree:*)"
        "Bash(find:*)"
        "Bash(fd:*)"
        "Bash(grep:*)"
        "Bash(rg:*)"
        "Bash(head:*)"
        "Bash(tail:*)"
        "Bash(wc:*)"
        "Bash(diff:*)"
        "Bash(file:*)"
        "Bash(stat:*)"
        "Bash(which:*)"
        "Bash(type:*)"
        "Bash(env:*)"
        "Bash(echo:*)"
        "Bash(pwd:*)"
        "Bash(cd:*)"
        "Bash(uname:*)"
        "Bash(git log:*)"
        "Bash(git status:*)"
        "Bash(git diff:*)"
        "Bash(git show:*)"
        "Bash(git branch:*)"
        "Bash(git remote:*)"
        "Bash(nix eval:*)"
        "Bash(nix flake show:*)"
        "Bash(nix flake metadata:*)"
      ];
      deny = [
        "Bash(rm -rf /*)"
      ];
    };
  };
}
