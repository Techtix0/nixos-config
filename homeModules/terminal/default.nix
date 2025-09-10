{config, pkgs, lib, ...}:
{
    imports = [
			./kitty.nix # Terminal emulator
			# ./sh.nix # Bash config
			./shell/starship.nix # Command prompt
			./shell/zsh.nix # Zsh config
		];
}
