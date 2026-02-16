{ hostname }:
{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  imports = [
    "${self}/system/greeter/greetd.nix"
    "${self}/system/programs/steam.nix"
    "${self}/system/graphics.nix"
    "${self}/system/packages.nix"
    "${self}/system/xdg.nix"
    "${self}/system/bluetooth.nix"
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  programs.zsh.enable = true;
  programs.dconf.enable = true;

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  console.keyMap = "de";

  users.users.farfallequalle = {
    isNormalUser = true;
    description = "farfallequalle";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.niri.overlays.niri
      inputs.nur.overlays.default
      inputs.claude-code.overlays.default
    ];
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.dates = "weekly";
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/farfallequalle/nixos-config";
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://niri.cachix.org" ];
    trusted-public-keys = [ "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" ];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.extraConfig."10-bluez" = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    tree
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs hostname; };
    sharedModules = [
      inputs.nixvim-config.homeModules.default
      inputs.noctalia-shell.homeModules.default
    ];
    users = {
      "farfallequalle" = import ./home.nix;
    };
  };

  system.stateVersion = "25.11";
}
