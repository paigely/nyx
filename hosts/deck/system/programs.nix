{pkgs, ...}: {
	programs = {
		fish.enable = true;
		nh = {
			enable = true;
			clean.enable = true;
			clean.extraArgs = "--keep-since 4d --keep 3";
			flake = "/home/pager/Projects/nix";
		};
		steam = {
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
			extraCompatPackages = with pkgs; [
				proton-ge-bin
			];
		};
	};
}
