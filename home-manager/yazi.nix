{
  programs.yazi = {
    enable = true;
  };

  xdg.configFile."yazi/yazi.toml".text = ''
    [opener]
    edit = [
      { run = 'nvim "$@"', block = true }
    ]
  '';
}
