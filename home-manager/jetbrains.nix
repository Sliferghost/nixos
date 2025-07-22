{ unstable, ... }:
{
  home.packages = with unstable; [
    (jetbrains.idea-ultimate.override {
      # TODO: Change this back to the normal JDK once the latest version is fixed: https://github.com/nixos/nixpkgs/issues/426815
      jdk = unstable.openjdk21;
    })
  ];

  home.sessionVariables = {
    "_JAVA_OPTIONS" = "-Xmx2048m -XX:MaxMetaspaceSize=512m";
  };
}
