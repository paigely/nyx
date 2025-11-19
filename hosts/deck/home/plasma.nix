{inputs, ...}: {
	imports = [
		inputs.plasma-manager.homeModules.plasma-manager
	];
	programs.plasma = {
		enable = true;
		workspace = {
			colorScheme = "untitled";
			widgetStyle = "darkly";
			lookAndFeel = "stylix";
			enableMiddleClickPaste = false;
		};
		panels = [
			{
				location = "bottom";
				lengthMode = "fit";
				alignment = "left";
				opacity = "translucent";
				floating = true;
				widgets = [
					{
						name = "org.kde.plasma.kickoff";
						config = {
							General = {
								icon = "nix-snowflake-white";
								alphaSort = true;
								compactMode = true;
								switchCategoryOnHover = true;
								showActionButtonCaptions = false;
							};
						};
					}
				];
			}
			{
				location = "bottom";
				lengthMode = "fit";
				alignment = "center";
				opacity = "translucent";
				floating = true;
				widgets = [
					{
						iconTasks = {
							launchers = [
								"applications:org.kde.dolphin.desktop"
								"applications:org.kde.konsole.desktop"
								"applications:librewolf.desktop"
								"applications:dev.zed.Zed.desktop"
								"applications:vesktop.desktop"
								"applications:spotify.desktop"
							];
						};
					}
				];
			}
			{
				location = "bottom";
				lengthMode = "fit";
				alignment = "right";
				opacity = "translucent";
				floating = true;
				widgets = [
					{
						systemTray.items = {
							shown = [
								"org.kde.plasma.battery"
								"org.kde.plasma.bluetooth"
								"org.kde.plasma.networkmanagement"
								"org.kde.plasma.volume"
							];
						};
					}
					{
						digitalClock = {
							time.format = "24h";
						};
					}
				];
			}
		];
		input = {
			mice = [
				{
					enable = true;
					leftHanded = false;
					acceleration = 0.2;
					accelerationProfile = "none";
					name = "Logitech G305";
					productId = "c53f";
					vendorId = "046d";
				}
				{
					enable = true;
					leftHanded = false;
					acceleration = 0.2;
					accelerationProfile = "none";
					name = "Valve Software Steam Controller";
					productId = "1205";
					vendorId = "28de";
				}
			];
		};
		configFile = {
			kactivitymanagerdrc.Plugins."org.kde.ActivityManager.ResourceScoringEnabled" = false;
			kactivitymanagerdrc.activities."4f585211-b2a8-44cf-ac70-f701bb50b43c" = "Default";
			kactivitymanagerdrc.main.currentActivity = "4f585211-b2a8-44cf-ac70-f701bb50b43c";
		};
	};
}
