{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		jovian = {
			url = "github:Jovian-Experiments/Jovian-NixOS";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		spicetify-nix = {
			url = "github:Gerg-L/spicetify-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};
		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		lix = {
			url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
			flake = false;
		};
		lix-module = {
			url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.lix.follows = "lix";
		};
		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = {
		nixpkgs,
		home-manager,
		lix-module,
		jovian,
		...
	} @ inputs: {
		nixosConfigurations = {
			deck =
				nixpkgs.lib.nixosSystem {
					specialArgs = {
						inherit inputs;
					};
					modules = [
						./hosts/deck/configuration.nix
						lix-module.nixosModules.default
						home-manager.nixosModules.default
						jovian.nixosModules.jovian
					];
				};
		};
	};
}
