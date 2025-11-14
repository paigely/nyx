{
	boot = {
		loader.systemd-boot.enable = true;
		loader.efi.canTouchEfiVariables = true;
		initrd.luks.devices."luks-d9221136-1433-45c2-80ec-ba13025efe6a".device = "/dev/disk/by-uuid/d9221136-1433-45c2-80ec-ba13025efe6a";
	};
	jovian = {
		steam.enable = false;
		decky-loader.enable = false;
		steamos = {
			useSteamOSConfig = true;
			enableZram = false;
		};
		hardware.has.amd.gpu = true;
		devices.steamdeck = {
			enable = true;
			autoUpdate = true;
			enableGyroDsuService = true;
		};
	};
	networking = {
		hostName = "deck";
		networkmanager.enable = true;
		firewall = {
			enable = true;
			allowedTCPPorts = [80 53317];
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
