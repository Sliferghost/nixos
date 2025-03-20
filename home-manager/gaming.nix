{ pkgs, ... }:
{
  home.packages = with pkgs; [
    heroic
    mgba
  ];

  xdg.configFile."mgba/config.ini".text = ''
    [input]
    keyA=X
    keyB=Z
    keyStart=Enter
    keySelect=Backspace
    keyL=A
    keyR=S
    keyUp=Up
    keyDown=Down
    keyLeft=Left
    keyRight=Right
  '';
}
