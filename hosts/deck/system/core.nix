{
	boot = {
		loader.systemd-boot.enable = true;
		loader.efi.canTouchEfiVariables = true;
		initrd.luks.devices."luks-d9221136-1433-45c2-80ec-ba13025efe6a".device = "/dev/disk/by-uuid/d9221136-1433-45c2-80ec-ba13025efe6a";
	};
	networking = {
		hostName = "deck";
		networkmanager.enable = true;
		firewall = rec {
			enable = true;
			allowedTCPPortRanges = [
				{
					from = 1714;
					to = 1764;
				}
				{
					from = 80;
					to = 80;
				}
				{
					from = 53317;
					to = 53317;
				}
			];
			allowedUDPPortRanges = allowedTCPPortRanges;
		};
	};
	security = {
		rtkit.enable = true;
	};
	services = {
		xserver.enable = true;
		displayManager.gdm.enable = true;
		desktopManager.gnome.enable = true;
		cloudflare-warp.enable = true;
		pulseaudio.enable = false;
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			jack.enable = true;
		};
		xserver = {
			xkb = {
				layout = "us";
				variant = "";
			};
		};
	};
}
