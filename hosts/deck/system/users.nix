{pkgs, ...}: {
	users.users.pager = {
		isNormalUser = true;
		description = "pager";
		shell = pkgs.fish;
		extraGroups = [
			"networkmanager"
			"wheel"
		];
	};
}
