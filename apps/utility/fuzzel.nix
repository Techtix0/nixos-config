{config, lib, pkgs, ...}:

{
  home.packages = [pkgs.fuzzel];
  programs.fuzzel = {
    enable = true;
    # settings = {
    #   main.layer = "overlay";
    #   colors = {
    #     background = "111111ff";
    #     text = "afafafff";
    #     selection = "88C0D0ff";
    #     match = "5E81ACff";
    #     selection-match = "ffffffff";
    #     selection-text = "000000ff";
    #     border = "111111ff";
    #   };
    # };
  };
}