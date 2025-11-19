{inputs, ...}: {
	system.stateVersion = "25.05";
	documentation.nixos.enable = false;
	nix.settings = {
		auto-optimise-store = true;
		experimental-features = ["nix-command" "flakes"];
	};
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.android_sdk.accept_license = true;

	imports = [
		./system/default.nix
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default
		inputs.stylix.nixosModules.stylix
	];

	home-manager = {
		extraSpecialArgs = {inherit inputs;};
		useGlobalPkgs = true;
		useUserPackages = true;
		verbose = false;
		backupFileExtension = "bak";
		users = {
			"pager" = import ./home/default.nix;
		};
	};
}
