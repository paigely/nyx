{
	config,
	lib,
	modulesPath,
	...
}: {
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "uas" "usbhid" "sd_mod" "sdhci_pci"];
	boot.initrd.kernelModules = [];
	boot.kernelModules = ["kvm-amd"];
	boot.extraModulePackages = [];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/03720184-b7b6-4001-8dc2-7de6c8bf6303";
		fsType = "ext4";
	};

	boot.initrd.luks.devices."luks-8388235c-12fb-40de-ad57-b388e966c87b".device = "/dev/disk/by-uuid/8388235c-12fb-40de-ad57-b388e966c87b";

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/F8D7-57F9";
		fsType = "vfat";
		options = ["fmask=0077" "dmask=0077"];
	};

	swapDevices = [
		{device = "/dev/disk/by-uuid/87bc0430-db70-4eb2-899f-7ff48c94cb7b";}
	];

	networking.useDHCP = lib.mkDefault true;

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
