{
  config,
  pkgs,
  ...
}: {

  imports = [
  	./modules
	./home-packages.nix
  ];

  home = {
  	username = "farfallequalle";
  	homeDirectory = "/home/farfallequalle";
	stateVersion = "25.05";
	};
}
