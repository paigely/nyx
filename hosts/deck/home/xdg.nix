{...}: {
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
		vesktop = {
			name = "Vesktop";
			icon = ../../../assets/icons/vesktop.svg;
			exec = "vesktop %U";
		};
		"dev.zed.Zed" = {
			name = "Zed";
			startupNotify = true;
			exec = "zeditor %U";
			icon = ../../../assets/icons/zed.png;
			mimeType = ["text/plain" "application/x-zerosize" "x-scheme-handler/zed"];
			actions = {
				NewWorkspace = {
					name = "Open a new workspace";
					exec = "zeditor --new %U";
				};
			};
		};
	};
}
