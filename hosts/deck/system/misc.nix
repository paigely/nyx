{
	pkgs,
	...
}: {
	environment.sessionVariables = {
		QT_STYLE_OVERRIDE = "darkly";
		QT_QPA_PLATFORMTHEME = "qt6ct";
	};
	stylix = {
		enable = true;
		polarity = "dark";
		image = ../../../assets/wallpapers/black_metal_contourline.png;
		base16Scheme = {
			base00 = "#000000";
			base01 = "#121212";
			base02 = "#222222";
			base03 = "#333333";
			base04 = "#999999";
			base05 = "#c1c1c1";
			base06 = "#999999";
			base07 = "#c1c1c1";
			base08 = "#5f8787";
			base09 = "#aaaaaa";
			base0A = "#a06666";
			base0B = "#dd9999";
			base0C = "#aaaaaa";
			base0D = "#888888";
			base0E = "#999999";
			base0F = "#444444";
		};

		cursor = {
			name = "Bibata-Modern-Classic";
			package = pkgs.bibata-cursors;
			size = 22;
		};

		fonts = let
			google-sans = pkgs.callPackage ../../../packages/google-sans.nix {};
		in {
			serif = {
				name = "Google Sans Flex";
				package = google-sans;
			};
			sansSerif = {
				name = "Google Sans Flex";
				package = google-sans;
			};
			monospace = {
				name = "Maple Mono NF";
				package = pkgs.maple-mono.NF;
			};
			emoji = {
				name = "Apple Color Emoji";
				package = pkgs.callPackage ../../../packages/apple-color-emoji.nix {};
			};
		};
		targets.qt.enable = false;
	};
}
