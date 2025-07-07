{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  options = {};

  config = {
		programs.rmpc = {
			enable = true;
			config = ''
			(
				address: 127.0.0.1:6600,
				password: None,
			)
			'';
		};
	};
}
