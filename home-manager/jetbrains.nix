{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
  ];

  home.sessionVariables = {
    "_JAVA_OPTIONS" = "-Xmx2048m -XX:MaxMetaspaceSize=512m";
  };
}
