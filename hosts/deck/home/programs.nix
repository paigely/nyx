{
	inputs,
	lib,
	pkgs,
	...
}: {
	stylix.targets = {
		qt.enable = false;
		vesktop.enable = false;
		librewolf.profileNames = ["default"];
		kde.decorations = "org.kde.darkly";
	};

	services.kdeconnect.enable = true;

	dconf.enable = true;
	dconf.settings."org/gnome/desktop/wm/preferences".button-layout = ":minimize,maximize,close";

	programs = {
		librewolf = {
			enable = true;
			profiles.default = {
				settings = {
					"webgl.disabled" = false;
					"gfx.webrender.compositor.force-enabled" = true;
					"privacy.resistFingerprinting" = false;
					"privacy.clearOnShutdown.history" = false;
					"privacy.clearOnShutdown.cookies" = false;
					"privacy.clearOnShutdown.sessions" = false;
					"privacy.clearOnShutdown.cache" = false;
					"privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
					"privacy.clearOnShutdown_v2.cache" = false;
					"privacy.sanitize.sanitizeOnShutdown" = false;
					"network.cookie.lifetimePolicy" = 0;
					"browser.warnOnQuit" = false;
					"browser.warnOnQuitShortcut" = false;
					"widget.use-xdg-desktop-portal.file-picker" = 1;
					"browser.toolbars.bookmarks.visibility" = "never";
				};
				extensions = {
					/*
          settings."uBlock0@raymondhill.net".settings = {
          	selectedFilterLists = [
          		"ublock-filters"
          		"ublock-badware"
          		"ublock-privacy"
          		"ublock-unbreak"
          		"ublock-quick-fixes"
          	];
          	};
          */
					packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
						sponsorblock
						stylus
						bitwarden
						darkreader
						user-agent-string-switcher
						violentmonkey
						ublacklist
						plasma-integration
					];
				};
			};
		};
		chromium = {
			enable = true;
			package = pkgs.ungoogled-chromium;
		};
		fastfetch = {
			enable = true;
			settings = {
				logo.type = "small";
				modules = [
					"title"
					"separator"
					"os"
					"kernel"
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
		eza = {
			enable = true;
			extraOptions = [
				"--group-directories-first"
				"--header"
				"--icons=always"
				"--tree"
				"--classify"
				"-L1"
			];
		};
		fish = {
			enable = true;
			interactiveShellInit = ''
				set fish_greeting
				set EDITOR micro
				set VISUAL micro
				set TZ "Europe/Berlin"
				abbr -a cat bat
				abbr -a ls eza
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
					language_servers = ["nixd" "!nil"];
					formatter.external = {
						command = "alejandra";
						arguments = ["--quiet" "--"];
					};
				};

				autosave.after_delay.milliseconds = 300;
			};
			userKeymaps = [
				{
					bindings."ctrl-q" = null;
				}
			];
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
