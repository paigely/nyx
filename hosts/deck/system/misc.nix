{pkgs, ...}: {
	programs.dconf.profiles.gdm.databases = [
		{
			settings = {
				"org/gnome/login-screen" = {
					disable-user-list = true;
				};
				"org/gnome/desktop/interface" = {
					clock-format = "24h";
					clock-show-date = true;
					clock-show-seconds = true;
					clock-show-weekday = true;
					cursor-blink = false;
					show-battery-percentage = true;
					toolkit-accessibility = true;
				};
			};
		}
	];
	programs.fish.enable = true;
	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 4d --keep 3";
		flake = "/home/pager/Projects/nix";
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
	};
}
