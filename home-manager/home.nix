{
  config,
  pkgs,
  inputs,
  ...
}: {

  imports = [
  	./modules
	./home-packages.nix
	inputs.mnw.homeManagerModules.mnw
  ];

  home = {
  	username = "farfallequalle";
  	homeDirectory = "/home/farfallequalle";
	stateVersion = "25.05";
	};
}
