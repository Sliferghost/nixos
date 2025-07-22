{ unstable, ... }:
{
  home.packages = with unstable; [
    (jetbrains.idea-ultimate.override {
      jdk = unstable.openjdk21;
    })
  ];

  home.sessionVariables = {
    "_JAVA_OPTIONS" = "-Xmx2048m -XX:MaxMetaspaceSize=512m";
  };
}
