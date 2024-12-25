{...}: {
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;
      format = "$username | $directory$git_branch$git_commit \n$cmd_duration$character";

      username = {
				show_always = true;
				style_user = "bold green";
				format = "[$user]($style)";
      };

			directory = {
				truncation_length = 1;	
				truncation_symbol = "./";
			};

			cmd_duration = {
				format = "[$duration]($style) ";
			};

    };
  };
}
