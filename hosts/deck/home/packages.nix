{pkgs, ...}: {
	home.packages = with pkgs; [
		(vesktop.override {electron = electron_39-bin;})
		vscodium
		android-studio
		gnome-builder
		dbeaver-bin
		sushi
		inkscape
		gimp
		steam
		pinta
		localsend
		celluloid
		nautilus-python
		nautilus-open-any-terminal
		gnomeExtensions.flickernaut
		gnomeExtensions.blur-my-shell
		gnomeExtensions.rounded-window-corners-reborn
		gnomeExtensions.appindicator
		gnomeExtensions.search-light
		gnomeExtensions.color-picker
		gnomeExtensions.compiz-alike-magic-lamp-effect
		gnomeExtensions.dash-to-dock
		gnomeExtensions.gsconnect
		(pkgs.callPackage ../../../packages/color-lsp.nix {})
		(pkgs.callPackage ../../../packages/discord-presence-lsp.nix {})
	];
}
