{
	pkgs,
	inputs,
	lib,
	...
}: {
	imports = [
		./hardware-configuration.nix
		./locale.nix
		inputs.home-manager.nixosModules.default
	];

	networking.hostName = "deck";
	networking.networkmanager.enable = true;
	networking.firewall = {
		enable = true;
		allowedTCPPorts = [80 53317];
	};
	system.stateVersion = "25.05";
	documentation.nixos.enable = false;
	nix.settings = {
		auto-optimise-store = true;
		experimental-features = ["nix-command" "flakes"];
	};

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.initrd.luks.devices."luks-d9221136-1433-45c2-80ec-ba13025efe6a".device = "/dev/disk/by-uuid/d9221136-1433-45c2-80ec-ba13025efe6a";

	# System programs
	programs.fish.enable = true;
	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 4d --keep 3";
		flake = "/home/pager/Projects/nix";
	};

	# Services
	services.xserver.enable = true;
	services.displayManager.gdm.enable = true;
	services.desktopManager.gnome.enable = true;
	services.cloudflare-warp.enable = true;
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	users.users.pager = {
		isNormalUser = true;
		description = "pager";
		shell = pkgs.fish;
		extraGroups = [
			"networkmanager"
			"wheel"
		];
	};

	home-manager = {
		extraSpecialArgs = {inherit inputs;};
		useGlobalPkgs = true;
		useUserPackages = true;
		verbose = false;
		backupFileExtension = "bak";
		users = {
			"pager" = import ./home.nix;
		};
	};

	nixpkgs.config.allowUnfreePredicate = pkg:
		builtins.elem (lib.getName pkg) [
			"spotify"
			"cloudflare-warp"
			"steam"
			"steam-unwrapped"
			"android-studio-stable"
		];

	environment.systemPackages = with pkgs; [
		git
		git-filter-repo
		fish
		fastfetch
		micro
		zip
		nodejs
		pnpm
		rustc
		rustfmt
		cargo
		android-tools
		nixd
		diff-so-fancy
		wget
		curl
		aria2
		fd
		file
		cloc
		clang
		lua
		ninja
		meson
		cmake
		alejandra
		killall
		unzip
		p7zip
		go
		gopls
	];

	services.xserver.excludePackages = [pkgs.xterm];
	environment.gnome.excludePackages = with pkgs; [
		baobab
		cheese
		epiphany
		simple-scan
		yelp
		evince
		geary
		seahorse
		snapshot
		decibels
		showtime
		totem
		gnome-calendar
		gnome-clocks
		gnome-contacts
		gnome-maps
		gnome-photos
		gnome-weather
		gnome-disk-utility
		gnome-connections
		gnome-music
		gnome-text-editor
		gnome-tour
	];
}
