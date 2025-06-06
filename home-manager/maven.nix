{ pkgs, ... }:
{
  home.packages = with pkgs; [
    maven
  ];

  home.file.".m2/settings.xml" = {
    text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 
                                    http://maven.apache.org/xsd/settings-1.0.0.xsd">
        <localRepository>~/.m2/repository</localRepository>
      </settings>
    '';
  };

  home.sessionVariables = {
    "MAVEN_OPTS" = "-Xms512m";
  };
}
