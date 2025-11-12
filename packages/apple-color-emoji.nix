{pkgs}:
pkgs.stdenv.mkDerivation {
	name = "apple-color-emoji";
	src = ../assets/unfree/AppleColorEmoji.ttf;
	dontUnpack = true;

	installPhase = ''
		install -Dm644 $src $out/share/fonts/truetype/AppleColorEmoji.ttf
	'';
}
