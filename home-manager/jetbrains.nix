{ unstable, ... }:
{
  home.packages = with unstable; [
    jetbrains.idea-ultimate
  ];

  home.sessionVariables = {
    "_JAVA_OPTIONS" = "-Xmx2048m -XX:MaxMetaspaceSize=512m";
  };
}
