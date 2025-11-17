{
	inputs,
	lib,
	pkgs,
	...
}: {
	stylix.targets = {
		zen-browser.profileNames = ["default"];
		vesktop.enable = false;
	};

	services = {
		kdeconnect = {
			enable = true;
			package = pkgs.gnomeExtensions.gsconnect;
		};
	};

	programs = {
		micro.enable = true;
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
					language_servers = ["nil" "!nixd"];
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
