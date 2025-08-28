{ pkgs, ... }: {
users.users.farfallequalle = {
    isNormalUser = true;
    description = "farfallequalle";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };
}
