{
  config,
  pkgs,
  inputs,
  self,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    "${self}/system/greeter/greetd.nix"
    "${self}/system/programs/steam.nix"
    "${self}/system/packages.nix"
    "${self}/system/xdg.nix"
    "${self}/system/bluetooth.nix"
    "${self}/system/programs/power.nix"
    inputs.home-manager.nixosModules.default
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fw13"; # Define your hostname.

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

  services.fwupd.enable = true;
  services.upower.enable = true;

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
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    tree
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    sharedModules = [
      inputs.nixvim.homeModules.nixvim
      inputs.noctalia-shell.homeModules.default
    ];
    users = {
      "farfallequalle" = import ./home.nix;
    };
  };

  system.stateVersion = "25.11"; 

}
