{pkgs}:
pkgs.stdenv.mkDerivation {
	name = "google-sans";
	src = ../assets/unfree;
	dontUnpack = true;

	installPhase = ''
		install -Dm644 $src/GoogleSans*.ttf -t $out/share/fonts/truetype
	'';
}
