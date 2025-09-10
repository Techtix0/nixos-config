#	Select language servers to install
{...}:

{
	imports = [
		./nixd.nix
		./lua-lsp.nix
		./rust-analyzer.nix
		./completion/luasnip.nix
	];
}

