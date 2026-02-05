{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers.nixd = {
          enable = true;
          settings = {
            formatting.command = [ "alejandra" ];
            nixpkgs.expr = "import <nixpkgs> {}";
            options.nixos.expr = ''(builtins.getFlake "/home/farfallequalle/nixos-config").nixosConfigurations.fw13.options'';
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
          formatters_by_ft.nix = [ "alejandra" ];
        };
      };
    };

    extraPackages = [ pkgs.alejandra ];
  };
}
