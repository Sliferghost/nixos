{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jdk21
  ];

  home.sessionVariables = {
    "JAVA_HOME" = "${pkgs.jdk21}/lib/openjdk";
  };
}
