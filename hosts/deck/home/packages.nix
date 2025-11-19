{pkgs, ...}: {
	home.packages = with pkgs; [
		(vesktop.override {electron = electron_39-bin;})
		vscodium
		scrcpy
		localsend
		android-tools
		android-studio
		android-studio-tools
		dbeaver-bin
		sushi
		gimp
		pinta
		inkscape
		mpv
		git-filter-repo
		(pkgs.callPackage ../../../packages/color-lsp.nix {})
		(pkgs.callPackage ../../../packages/discord-presence-lsp.nix {})
	];
}
