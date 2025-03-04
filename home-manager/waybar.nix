{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 30;
	spacing = 4;
	output = [ "HDMI-A-1" ];

	modules-left = [
	  "hyprland/workspaces"
	];
	modules-center = [
	  "hyprland/window"
	];
	modules-right = [
	  "network"
	  "clock"
	  "tray"
	  "custom/power"
	];

	"network" = {
	  #interface = "wlp2*"; # (Optional) To force the use of this interface
	  format-wifi = "{essid} ({signalStrength}%) <U+F1EB>";
	  format-ethernet = "{ipaddr}/{cidr} <U+F796>";
	  tooltip-format = "{ifname} via {gwaddr} <U+F796>";
	  format-linked = "{ifname} (No IP) <U+F796>";
	  format-disconnected = "Disconnected ⚠";
	  format-alt = "{ifname}: {ipaddr}/{cidr}";
	};

	"clock" = {
	  # timezone = "Europe/Amsterdam";
	  # tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
	  # format-alt = "{:%Y-%m-%d}";
	};

	"tray" = {
	  # icon-size = 21;
	  spacing = 10;
	};

	"custom/power" = {
	  format = "⏻ ";
	  tooltip = false;
	  menu = "on-click";
	  # menu-file = "$HOME/.config/waybar/power_menu.xml";
	  menu-actions = {
	    shutdown = "shutdown";
	    reboot = "reboot";
	    lock = "hyprlock";
	  };
	};
      };
    };
  };
}
