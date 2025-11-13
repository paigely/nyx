{pkgs}:
pkgs.rustPlatform.buildRustPackage rec {
	pname = "color-lsp";
	version = "577afec8cb94c83747ad567f3304727835d27f9b";
	cargoHash = "sha256-CiL0uO0KSypnDvKcEpips7p6BbTXLLHM+ZYm3O21g+A=";

	src =
		pkgs.fetchFromGitHub {
			owner = "huacnlee";
			repo = "color-lsp";
			rev = version;
			hash = "sha256-7hdK0+FdZHF/PZn8z+Fl/Okvc5tr5HQqRaUFbpR7/ig=";
		};

	cargoBuildFlags = "--package color-lsp";
}
