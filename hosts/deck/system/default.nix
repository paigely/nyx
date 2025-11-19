{lib, ...}: {
	imports =
		[
			./core.nix
			./misc.nix
			./packages.nix
			./programs.nix
			./users.nix
		]
		++ lib.optional (builtins.pathExists ./private.nix) ./private.nix;
}
