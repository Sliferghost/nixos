{ unstable, ... }:
{
  home.packages = with unstable; [
    jetbrains.idea-ultimate
    jetbrains.rider
    dotnetCorePackages.sdk_9_0-bin
  ];

  home.sessionVariables = {
    "_JAVA_OPTIONS" = "-Xmx2048m -XX:MaxMetaspaceSize=512m";
  };
}
