# Generated via dconf2nix: https://github.com/nix-commmunity/dconf2nix
{
	lib,
	pkgs,
	...
}:
with lib.hm.gvariant; {
	dconf.enable = true;
	dconf.settings = {
		"org/gnome/shell" = {
			enabled-extensions = with pkgs.gnomeExtensions; [
				flickernaut.extensionUuid
				blur-my-shell.extensionUuid
				rounded-window-corners-reborn.extensionUuid
				appindicator.extensionUuid
				search-light.extensionUuid
				color-picker.extensionUuid
				compiz-alike-magic-lamp-effect.extensionUuid
				dash-to-dock.extensionUuid
				gsconnect.extensionUuid
			];
			favorite-apps = ["org.gnome.Nautilus.desktop" "zen-beta.desktop" "dev.zed.Zed.desktop" "vesktop.desktop" "spotify.desktop" "org.gnome.Console.desktop"];
		};

		"org/gnome/desktop/wm/preferences" = {
			button-layout = ":minimize,maximize,close";
		};

		"org/gnome/desktop/calendar" = {
			show-weekdate = true;
		};

		"org/gnome/desktop/datetime" = {
			automatic-timezone = true;
		};

		"org/gnome/desktop/input-sources" = {
			sources = [(mkTuple ["xkb" "us"])];
			xkb-options = ["lv3:switch"];
		};

		"org/gnome/desktop/interface" = {
			clock-format = "24h";
			clock-show-date = true;
			clock-show-seconds = true;
			clock-show-weekday = true;
			cursor-blink = false;
			enable-hot-corners = false;
			show-battery-percentage = true;
			toolkit-accessibility = false;
			gtk-enable-primary-paste = false;
		};

		"org/gnome/desktop/peripherals/keyboard" = {
			delay = 324;
			repeat-interval = 13;
		};

		"org/gnome/desktop/peripherals/mouse" = {
			accel-profile = "flat";
			speed = mkDouble "0.0";
		};

		"org/gnome/desktop/peripherals/touchpad" = {
			two-finger-scrolling-enabled = true;
		};

		"org/gnome/desktop/privacy" = {
			disable-camera = true;
		};

		"org/gnome/desktop/screen-time-limit" = {
			daily-limit-enabled = false;
			history-enabled = false;
		};

		"org/gnome/desktop/screen-time-limits" = {
			daily-limit-enabled = false;
			history-enabled = false;
		};

		"org/gnome/desktop/wm/keybindings" = {
			activate-window-menu = [];
			show-screenshot-ui = ["<Shift><Super>s"];
			switch-input-source = [];
			switch-input-source-backward = [];
		};

		"org/gnome/file-roller/file-selector" = {
			show-hidden = true;
		};

		"org/gnome/file-roller/listing" = {
			list-mode = "as-folder";
			name-column-width = 72;
			show-path = true;
			sort-method = "name";
			sort-type = "ascending";
		};

		"org/gnome/mutter" = {
			experimental-features = ["scale-monitor-framebuffer" "xwayland-native-scaling"];
		};

		"org/gnome/nautilus/icon-view" = {
			captions = ["size" "none" "none"];
			default-zoom-level = "medium";
			sort-directories-first = true;
		};

		"org/gnome/nautilus/list-view" = {
			use-tree-view = true;
		};

		"org/gnome/nautilus/preferences" = {
			default-folder-viewer = "icon-view";
			search-filter-time-type = "last_modified";
			show-create-link = true;
			show-create-permanently = true;
			show-delete-permanently = true;
		};

		"org/gnome/shell/extensions/appindicator" = {
			icon-brightness = mkDouble "0.0";
			icon-contrast = mkDouble "0.0";
			icon-opacity = 255;
			icon-saturation = mkDouble "0.0";
			icon-size = 24;
		};

		"org/gnome/shell/extensions/blur-my-shell" = {
			pipelines = [
				(mkDictionaryEntry [
						"pipeline_default"
						[
							(mkDictionaryEntry ["name" (mkVariant "Default")])
							(mkDictionaryEntry [
									"effects"
									(mkVariant [
											(mkVariant [
													(mkDictionaryEntry ["type" (mkVariant "native_static_gaussian_blur")])
													(mkDictionaryEntry ["id" (mkVariant "effect_87305961920195")])
													(mkDictionaryEntry [
															"params"
															(mkVariant [
																	(mkDictionaryEntry ["unscaled_radius" (mkVariant 67)])
																	(mkDictionaryEntry ["brightness" (mkVariant (mkDouble "0.6"))])
																])
														])
												])
											(mkVariant [
													(mkDictionaryEntry ["type" (mkVariant "monte_carlo_blur")])
													(mkDictionaryEntry ["id" (mkVariant "effect_75706429058068")])
													(mkDictionaryEntry [
															"params"
															(mkVariant [
																	(mkDictionaryEntry ["radius" (mkVariant (mkDouble "4.55"))])
																	(mkDictionaryEntry ["iterations" (mkVariant 2)])
																	(mkDictionaryEntry ["brightness" (mkVariant (mkDouble "0.6"))])
																])
														])
												])
										])
								])
						]
					])
				(mkDictionaryEntry [
						"pipeline_default_rounded"
						[
							(mkDictionaryEntry ["name" (mkVariant "Default rounded")])
							(mkDictionaryEntry [
									"effects"
									(mkVariant [
											(mkVariant [
													(mkDictionaryEntry ["type" (mkVariant "native_static_gaussian_blur")])
													(mkDictionaryEntry ["id" (mkVariant "effect_000000000001")])
													(mkDictionaryEntry [
															"params"
															(mkVariant [
																	(mkDictionaryEntry ["radius" (mkVariant 30)])
																	(mkDictionaryEntry ["brightness" (mkVariant (mkDouble "0.6"))])
																])
														])
												])
											(mkVariant [
													(mkDictionaryEntry ["type" (mkVariant "corner")])
													(mkDictionaryEntry ["id" (mkVariant "effect_000000000002")])
													(mkDictionaryEntry [
															"params"
															(mkVariant [
																	(mkDictionaryEntry ["radius" (mkVariant 24)])
																])
														])
												])
										])
								])
						]
					])
			];
			settings-version = 2;
		};

		"org/gnome/shell/extensions/blur-my-shell/appfolder" = {
			brightness = mkDouble "0.6";
			sigma = 30;
		};

		"org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
			pipeline = "pipeline_default";
		};

		"org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
			blur = true;
			brightness = mkDouble "0.6";
			pipeline = "pipeline_default_rounded";
			sigma = 30;
			static-blur = true;
			style-dash-to-dock = 0;
		};

		"org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
			pipeline = "pipeline_default";
		};

		"org/gnome/shell/extensions/blur-my-shell/overview" = {
			pipeline = "pipeline_default";
		};

		"org/gnome/shell/extensions/blur-my-shell/panel" = {
			brightness = mkDouble "0.6";
			pipeline = "pipeline_default";
			sigma = 30;
			static-blur = true;
		};

		"org/gnome/shell/extensions/blur-my-shell/screenshot" = {
			pipeline = "pipeline_default";
		};

		"org/gnome/shell/extensions/blur-my-shell/window-list" = {
			brightness = mkDouble "0.6";
			sigma = 30;
		};

		"org/gnome/shell/extensions/color-picker" = {
			color-picker-shortcut = ["<Shift><Super>c"];
			enable-shortcut = true;
			enable-systray = false;
		};

		"org/gnome/shell/extensions/dash-to-dock" = {
			dock-fixed = true;
			hot-keys = false;
			show-mounts = false;
			multi-monitor = true;
			disable-overview-on-startup = true;
		};

		"org/gnome/shell/extensions/flickernaut" = {
			applications = [
				''
					{"id":"a0648zRExjLj","appId":"dev.zed.Zed.desktop","name":"Zed","icon":"zed","pinned":false,"multipleFiles":true,"multipleFolders":true,"packageType":"Native","mimeTypes":["text/plain","application/x-zerosize","x-scheme-handler/zed"],"enable":true}
				''
				''
					{"id":"d8KhGN48ZSLt","appId":"codium.desktop","name":"VSCodium","icon":"vscodium","pinned":false,"multipleFiles":true,"multipleFolders":true,"packageType":"Native","mimeTypes":[""],"enable":true}
				''
			];
			settings-version = mkUint32 2;
		};

		"org/gnome/shell/extensions/rounded-window-corners-reborn" = {
			border-width = 1;
			global-rounded-corner-settings = [
				(mkDictionaryEntry [
						"padding"
						(mkVariant [
								(mkDictionaryEntry ["left" (mkUint32 1)])
								(mkDictionaryEntry ["right" 1])
								(mkDictionaryEntry ["top" 1])
								(mkDictionaryEntry ["bottom" 1])
							])
					])
				(mkDictionaryEntry [
						"keepRoundedCorners"
						(mkVariant [
								(mkDictionaryEntry ["maximized" false])
								(mkDictionaryEntry ["fullscreen" false])
							])
					])
				(mkDictionaryEntry ["borderRadius" (mkVariant (mkUint32 15))])
				(mkDictionaryEntry ["smoothing" (mkVariant (mkDouble "0.1"))])
				(mkDictionaryEntry ["borderColor" (mkVariant (mkTuple [(mkDouble "1.0") (mkDouble "1.0") (mkDouble "1.0") (mkDouble "0.059999998658895493")]))])
				(mkDictionaryEntry ["enabled" (mkVariant true)])
			];
			settings-version = mkUint32 7;
			skip-libadwaita-app = false;
			skip-libhandy-app = false;
		};

		"org/gnome/shell/extensions/rounded-window-corners-reborn/global-rounded-corner-settings" = {
			borderColor = "(0.14117647707462311, 0.12156862765550613, 0.19215686619281769, 1.0)";
			borderRadius = 15;
			enabled = true;
			smoothing = mkDouble "0.1";
		};

		"org/gnome/shell/extensions/rounded-window-corners-reborn/global-rounded-corner-settings/keepRoundedCorners" = {
			fullscreen = false;
			maximized = false;
		};

		"org/gnome/shell/extensions/rounded-window-corners-reborn/global-rounded-corner-settings/padding" = {
			bottom = 1;
			left = 1;
			right = 1;
			top = 1;
		};

		"org/gnome/shell/extensions/search-light" = {
			animation-speed = mkDouble "100.0";
			blur-brightness = mkDouble "0.6";
			blur-sigma = mkDouble "30.0";
			border-radius = mkDouble "7.0";
			border-color = "(0.14117647707462311, 0.12156862765550613, 0.19215686619281769, 1.0)";
			background-color = "(0.0, 0.0, 0.0, 0.6600000262260437)";
			border-thickness = 1;
			entry-font-size = 1;
			popup-at-cursor-monitor = true;
			use-animations = false;
			preferred-monitor = 0;
			scale-height = mkDouble "0.1";
			scale-width = mkDouble "0.1";
			shortcut-search = ["<Super>space"];
			secondary-shortcut-search = ["<Super>space"];
			show-panel-icon = false;
		};

		"org/gnome/shell/keybindings" = {
			show-screenshot-ui = ["<Shift><Super>s"];
		};

		"org/gtk/gtk4/settings/file-chooser" = {
			show-hidden = true;
			sort-directories-first = true;
		};

		"org/gtk/settings/file-chooser" = {
			clock-format = "24h";
			date-format = "regular";
			show-hidden = true;
			sort-directories-first = true;
		};

		"org/gnome/builder" = {
			format-on-save = true;
		};

		"org/gnome/builder/editor" = {
			line-height = mkDouble "1.3";
			font-name = "Maple Mono NF 12";
			style-scheme-name = "Adwaita-dark";
			auto-save-timeout = 1;
			show-grid-lines = false;
			draw-spaces = ["space" "tab"];
		};

		"org/gnome/builder/terminal" = {
			scroll-on-output = true;
		};

		"org/gnome/builder/project-tree" = {
			show-ignored-files = true;
		};
	};
}
