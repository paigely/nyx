{inputs, ...}: {
	home.stateVersion = "25.05";
	home.homeDirectory = "/home/pager";
	programs.home-manager.enable = true;

	# TODO: glob
	imports = [
		./dconf.nix
		./packages.nix
		./programs.nix
		./xdg.nix
		inputs.zen-browser.homeModules.beta
		inputs.spicetify-nix.homeManagerModules.default
	];
}
