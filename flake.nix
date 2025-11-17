{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = {
		nixpkgs,
		home-manager,
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
						home-manager.nixosModules.default
					];
				};
		};
	};
}
