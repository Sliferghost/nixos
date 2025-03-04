{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 37;
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

	"hyprland/workspaces" = {
	  persistent-workspaces = {
	    "*" = 10;
	  };
	};

	"pulseaudio" = {
	  format = "{icon} {volume}%";
	  format-muted = " ";
	  format-icons = {
	    default = ["" " " " "];
	  };
	  on-click = "pavucontrol";
	};

	"network" = {
	  format-wifi = "<span size='13000' foreground='#f5e0dc'>  </span>{essid}";
	  format-ethernet = "<span size='13000' foreground='#f5e0dc'>󰤭  </span> Disconnected";
	  format-linked = "{ifname} (No IP) 󱚵 ";
	  format-disconnected = "<span size='13000' foreground='#f5e0dc'>  </span>Disconnected";
	  tooltip-format-wifi = "Signal Strenght: {signalStrength}%";
	};

	"clock" = {
	  format = "{:%I:%M %p}";
	  format-alt = "{:%Y-%m-%d}";
	  tooltip = false;
	};

	"tray" = {
	  # icon-size = 21;
	  spacing = 10;
	};

	"custom/power" = {
	  format = "⏻";
	  tooltip = false;
	  menu = "on-click";
	  menu-file = "$HOME/.config/waybar/power_menu.xml";
	  menu-actions = {
	    lock = "hyprlock";
	    reboot = "reboot";
	    shutdown = "shutdown";
	  };
	};
      };
    };

    style = ''
* {
    font-family: "JetBrainMono Nerd Font";
    font-size: 16px;
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
#scratchpad,
#window,
#custom-power {
  margin-top: 2px;
  margin-bottom: 2px;
  margin-left: 4px;
  margin-right: 4px;
  padding-left: 4px;
  padding-right: 4px;
}

#window {
    color: @lavender;
    border-bottom: 2px solid @lavender;
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

#custom-power {
    padding-right: 8px;
    color: @rosewater;
    border-bottom: 2px solid @rosewater;
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

  home.file.".config/waybar/power_menu.xml" = {
    text = ''
  <?xml version="1.0" encoding="UTF-8"?>
<interface>
  <object class="GtkMenu" id="menu">
    <child>
      <object class="GtkMenuItem" id="lock">
        <property name="label">Lock</property>
      </object>
    </child>
    <child>
      <object class="GtkSeparatorMenuItem" id="delimiter1"/>
    </child>
    <child>
      <object class="GtkMenuItem" id="reboot">
        <property name="label">Reboot</property>
      </object>
    </child>
    <child>
      <object class="GtkMenuItem" id="shutdown">
        <property name="label">Shutdown</property>
      </object>
    </child>
  </object>
</interface>
  '';
  };
}
