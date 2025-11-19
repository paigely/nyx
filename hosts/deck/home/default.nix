{inputs, ...}: {
	home.stateVersion = "25.05";
	home.homeDirectory = "/home/pager";
	programs.home-manager.enable = true;

	# TODO: glob
	imports = [
		./packages.nix
		./plasma.nix
		./programs.nix
		./xdg.nix
		inputs.spicetify-nix.homeManagerModules.default
	];
}
