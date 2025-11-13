{
	pkgs,
	inputs,
	lib,
	...
}: {
	imports = [
		inputs.zen-browser.homeModules.beta
		inputs.spicetify-nix.homeManagerModules.default
		inputs.stylix.homeModules.stylix
		./dconf.nix
	];

	home.stateVersion = "25.05";
	home.homeDirectory = "/home/pager";
	programs.home-manager.enable = true;

	home.packages = with pkgs; [
		vesktop
		zed-editor
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
		(pkgs.callPackage ../../packages/discord-presence-lsp.nix {})
		(pkgs.callPackage ../../packages/color-lsp.nix {})
	];

	xdg.desktopEntries = {
		micro = {
			name = "Micro";
			noDisplay = true;
		};
		kvantummanager = {
			name = "Kvantum Manager";
			noDisplay = true;
		};
		qt5ct = {
			name = "Qt5 Settings";
			noDisplay = true;
		};
		qt6ct = {
			name = "Qt6 Settings";
			noDisplay = true;
		};
	};

	stylix = {
		enable = true;
		overlays.enable = false;
		polarity = "dark";
		image = ../../assets/JWqNRC1.jpeg;
		base16Scheme = "${inputs.tt-schemes}/base16/chinoiserie-night.yaml";

		targets = {
			zen-browser.profileNames = ["default"];
			vesktop.enable = false;
		};

		icons = {
			enable = true;
			dark = "WhiteSur";
			light = "WhiteSur";
			package = pkgs.whitesur-icon-theme.override {
				boldPanelIcons = true;
				alternativeIcons = true;
			};
		};

		cursor = {
			name = "Bibata-Modern-Classic";
			package = pkgs.bibata-cursors;
			size = 22;
		};

		fonts = let
			google-sans = pkgs.callPackage ../../packages/google-sans.nix {};
		in {
			serif = {
				package = google-sans;
				name = "Google Sans Flex";
			};
			sansSerif = {
				package = google-sans;
				name = "Google Sans Flex";
			};
			monospace = {
				package = pkgs.maple-mono.NF;
				name = "Maple Mono NF";
			};
			emoji = {
				package = pkgs.callPackage ../../packages/apple-color-emoji.nix {};
				name = "Apple Color Emoji";
			};
		};
	};

	programs = {
		micro.enable = true;
		vesktop.enable = true;
		fastfetch = {
			enable = true;
			settings = {
				logo.type = "small";
				modules = [
					"title"
					"separator"
					"os"
					"cpu"
					"memory"
					"host"
					"disk"
					"packages"
					"localip"
					"uptime"
				];
			};
		};
		fish = {
			enable = true;
			interactiveShellInit = ''
				set fish_greeting
				set EDITOR micro
				set VISUAL micro
				set TZ "Europe/Berlin"
				function fish_prompt -d "Write out the prompt"
					printf '(%s%s%s) $ ' \
						(set_color magenta) (prompt_pwd) (set_color normal)
				end
			'';
		};
		diff-so-fancy = {
			enable = true;
			enableGitIntegration = true;
		};
		# TODO
		#git = {
		#	enable = true;
		#	settings = {
		#		init.defaultBranch = "master";
		#		format.signOff = true;
		#	};
		#};
		zed-editor = {
			enable = true;
			extensions = [
				"nix"
				"toml"
				"rust"
				"astro"
				"sql"
				"make"
				"swift"
				"deno"
			];
			userSettings = {
				disable_ai = true;
				auto_update = false;
				telemetry.metrics = false;
				telemetry.diagnostics = false;
				title_bar.show_sign_in = false;

				tab_size = 4;
				hard_tabs = true;
				show_whitespaces = "all";
				tabs.file_icons = true;
				ui_font_size = lib.mkForce 17.0;
				ui_font_weight = lib.mkForce 300.0;
				buffer_font_size = lib.mkForce 15.0;
				buffer_font_weight = lib.mkForce 300.0;


				languages."Nix" = {
					language_servers = [ "nixd" "!nil" ];
					formatter.external = {
						command = "alejandra";
						arguments = ["--quiet" "--"];
					};
				};
			};
		};
		vscode = {
			enable = true;
			package = pkgs.vscodium;
			profiles.default.extensions = with pkgs.vscode-extensions; [
				denoland.vscode-deno
				astro-build.astro-vscode
				editorconfig.editorconfig
				stylelint.vscode-stylelint
				bradlc.vscode-tailwindcss
			];
		};
		zen-browser = {
			enable = true;
			nativeMessagingHosts = [pkgs.firefoxpwa];
			policies = {
				AutofillAddressEnabled = false;
				AutofillCreditCardEnabled = false;
				DisableAppUpdate = true;
				DisableFeedbackCommands = true;
				DisableFirefoxStudies = true;
				DisablePocket = true;
				DisableTelemetry = true;
				DontCheckDefaultBrowser = true;
				NoDefaultBookmarks = true;
				OfferToSaveLogins = false;
				EnableTrackingProtection = {
					Value = true;
					Locked = true;
					Cryptomining = true;
					Fingerprinting = true;
				};
				Cookies = {
					Behavior = "reject-foreign";
					Locked = true;
				};
				Preferences = let
					locked = value: {
						"Value" = value;
						"Status" = "locked";
					};
				in {
					"browser.tabs.warnOnClose" = locked false;
					"zen.view.use-single-toolbar" = locked false;
				};
			};
			profiles."default" = {
				extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
					adnauseam
					sponsorblock
					stylus
					bitwarden
					darkreader
					user-agent-string-switcher
					violentmonkey
					ublacklist
				];
			};
		};
		spicetify = let
			spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
		in {
			enable = true;
			enabledExtensions = with spicePkgs.extensions; [
				adblock
				hidePodcasts
			];
		};
	};
}
