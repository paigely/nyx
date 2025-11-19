{pkgs, ...}: {
	users = {
		groups.plugdev = {};
		users.pager = {
			isNormalUser = true;
			description = "pager";
			shell = pkgs.fish;
			extraGroups = [
				"networkmanager"
				"wheel"
				"adbusers"
				"kvm"
				"plugdev"
			];
		};
	};
}
