{...}: {
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;
      format = "$username$hostname$directory$git_branch$git_status\${custom.nix}$lua$rust$nix_shell\n$cmd_duration$shlvl$character";

      username = {
        show_always = true;
        style_user = "bold green";
        format = "[$user]($style)";
      };

      directory = {
				format = " [$path]($style)[$read_only]($read_only_style) ";
        truncation_length = 1;
        truncation_symbol = "./";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
      };

			custom.nix = {
				description = "Shows nix icon when detecting *.nix files in the current directory";
				format = "[$symbol($output)]($style) ";
				command = "nix --version | tr -d '[[:alpha:]() ]' ";
				symbol = "󱄅 v";
				style = "bold blue";
				detect_extensions = ["nix"];
			};

      lua = {
				format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      rust = {
				format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      shlvl = {
        disabled = false;
        threshold = 2;
        symbol = "󱞪 ";
      };

      nix_shell = {
				format = "[$symbol$state( \($name\))]($style)";
        symbol = "󱄅 ";
      };
    };
  };
}
