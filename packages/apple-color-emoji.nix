{pkgs}:
pkgs.stdenv.mkDerivation {
	name = "apple-color-emoji";
	src =
		pkgs.fetchurl {
			url = "https://github.com/samuelngs/apple-emoji-linux/releases/download/v18.4/AppleColorEmoji.ttf";
			hash = "sha256-pP0He9EUN7SUDYzwj0CE4e39SuNZ+SVz7FdmUviF6r0=";
		};
	dontUnpack = true;

	installPhase = ''
		mkdir -p $out/share/fonts/truetype
		install -Dm644 $src $out/share/fonts/truetype/AppleColorEmoji.ttf
	'';
}
