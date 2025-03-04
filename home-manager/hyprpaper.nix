{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";

      splash = false;

      preload = [
        "~/nix/backgrounds/Rainnight.jpg"
      ];

      wallpaper = [
        "HDMI-A-1,~/nix/backgrounds/Rainnight.jpg"
      ];
    };
  };
}
