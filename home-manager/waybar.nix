{
  # TODO: Fix the power menu
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	spacing = 10;
	output = [ "HDMI-A-1" ];

	modules-left = [
	  "hyprland/workspaces"
	];
	modules-center = [
	  "hyprland/window"
	];
	modules-right = [
	  "pulseaudio"
	  "network"
	  "clock"
	  "tray"
	  "custom/power"
	];

	"pulseaudio" = {
	  format = "{icon} {volume}%";
	  format-muted = " ";
	  format-icons = {
	    default = ["" " " " "];
	  };
	  on-click = "pavucontrol";
	};

	"network" = {
	  #interface = "wlp2*"; # (Optional) To force the use of this interface
	  format-wifi = "{essid} ({signalStrength}%)  ";
	  format-ethernet = "{ipaddr}/{cidr} 󰈀 ";
	  tooltip-format = "{ifname} via {gwaddr} ";
	  format-linked = "{ifname} (No IP) 󱚵 ";
	  format-disconnected = "Disconnected 󰖪 ";
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

    style = ''
* {
    font-family: "JetBrainMono Nerd Font";
    font-size: 16px;
    min-height: 0;
    font-weight: bold;
}

window#waybar {
    background: transparent;
    background-color: @crust;
    color: @overlay0;
    transition-property: background-color;
    transition-duration: 0.1s;
    border-bottom: 1px solid @overlay1;
}

#window {
    margin: 8px;
    padding-left: 8px;
    padding-right: 8px;
    color: @lavender;
    border-bottom: 2px solid @lavender;
}

button {
    box-shadow: inset 0 -3px transparent;
    border: none;
    border-radius: 0;
}

button:hover {
    background: inherit;
    color: @mauve;
    border-top: 2px solid @mauve;
}

#workspaces button {
    padding: 0 4px;
}

#workspaces button.focused {
    background-color: rgba(0, 0, 0, 0.3);
    color: @rosewater;
    border-top: 2px solid @rosewater;
}

#workspaces button.active {
    background-color: rgba(0, 0, 0, 0.3);
    color: @mauve;
    border-top: 2px solid @mauve;
}

#workspaces button.urgent {
    background-color: #eb4d4b;
}

#pulseaudio,
#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#wireplumber,
#tray,
#network,
#mode,
#scratchpad {
  margin-top: 2px;
  margin-bottom: 2px;
  margin-left: 4px;
  margin-right: 4px;
  padding-left: 4px;
  padding-right: 4px;
}

#clock {
    color: @maroon;
    border-bottom: 2px solid @maroon;
}

#clock.date {
    color: @mauve;
    border-bottom: 2px solid @mauve;
}

#pulseaudio {
    color: @blue;
    border-bottom: 2px solid @blue;
}

#network {
    color: @yellow;
    border-bottom: 2px solid @yellow;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left>widget:first-child>#workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right>widget:last-child>#workspaces {
    margin-right: 0;
}
    '';
  };
}
