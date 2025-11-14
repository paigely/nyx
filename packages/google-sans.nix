{
	pkgs,
	prefix ? "https://github.com/PixelOS-AOSP/vendor_aosp/raw/refs/heads/fifteen/fonts/",
}:
pkgs.stdenv.mkDerivation {
	name = "google-sans";
	srcs = with pkgs; [
		(fetchurl
			{
				url = "${prefix}GoogleSans-Italic.ttf";
				hash = "sha256-fOJdi27qWX+nuXy6cduTFb7HItq1bI7XFmLoG/RfzJo=";
			})
		(fetchurl
			{
				url = "${prefix}GoogleSans-Regular.ttf";
				hash = "sha256-3vBIknTUxlCSlQrLhwt7ZbYQ3KA9O8+zzVwIMYm/CVY=";
			})
		(fetchurl
			{
				url = "${prefix}GoogleSansClock-Regular.ttf";
				hash = "sha256-4XO97Yoqmk1ytkryQgjD7y0vjgn/KkyvOe+m4nfHDiA=";
			})
		(fetchurl
			{
				url = "${prefix}GoogleSansFlex-Regular.ttf";
				hash = "sha256-6uXtbd771Eq5aTuERUzkbz8t4PtPfMW1QTjFDFs0fXA=";
			})
		(fetchurl
			{
				url = "${prefix}GoogleSansFlexClock-Regular.ttf";
				hash = "sha256-rsfZSzxOX8NrGZkj2LReXUg5yzSrWRVBu40AAUObm1U=";
			})
	];
	dontUnpack = true;
	installPhase = ''
		mkdir -p $out/share/fonts/truetype
		install -m644 $srcs/* $out/share/fonts/truetype
	'';
}
