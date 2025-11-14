{lib, ...}: {
	imports =
		[
			./core.nix
			./misc.nix
			./packages.nix
			./users.nix
		]
		++ lib.optional (builtins.pathExists ./private.nix) ./private.nix;
}
