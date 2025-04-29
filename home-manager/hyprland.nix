{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings =
      let
        cursor = "catppuccin-mocha-mauve-cursors";
        terminal = "kitty";
        fileManager = "kitty --class yazi -e 'yazi'";
        menu = "wofi --show drun";
      in
      {
        monitor = ",preferred,auto,auto";

        env = [
          "XCURSOR_THEME,${cursor}"
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_THEME,${cursor}"
          "HYPRCURSOR_SIZE,32"
          "ELECTRON_OZONE_PLATFORM_HINT,wayland"
          "MOZ_ENABLE_WAYLAND,1"
          "MOZ_DBUS_REMOTE,1"
        ];

        exec-once = [
          "clipse -listen"
          "waybar"
          "blueman-applet"
        ];

        "$mod" = "SUPER";

        bind = [
          "$mod, Return, exec, ${terminal}"
          "$mod, C, killactive"
          "$mod, M, exit"
          "$mod, E, exec, ${fileManager}"
          "$mod, Space, exec, ${menu}"
          "$mod, V, exec, ${terminal} --class clipse -e 'clipse'"
          "$mod CTRL, Q, exec, hyprlock"

          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"

          "$mod Shift, H, movewindow, l"
          "$mod Shift, J, movewindow, d"
          "$mod Shift, K, movewindow, u"
          "$mod Shift, L, movewindow, r"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
          "float,class:(clipse)"
          "size 622 652,class:(clipse)"
          "float,class:(pavucontrol)"
          "size 800 600,class:(pavucontrol)"
          "float,class:(blueman-manager)"
          "size 1280 720,class:(blueman-manager)"
          "float,class:(nm-connection-editor)"
          "size 1280 720,class:(nm-connection-editor)"
          "minsize 230 200, initialTitle:(UnityEditor.AddComponent.AddComponentWindow)"
          "minsize 230 200, initialTitle:(UnityEditor.Rendering.FilterWindow)"
          "minsize 300 200, initialTitle:(UnityEditor.LayerVisibilityWindow)"
          "minsize 230 500, initialTitle:(UnityEditor.AnnotationWindow)"
          "minsize 150 300, initialTitle:(UnityEditor.PopupWindow)"
          "minsize 500 350, initialTitle:(Select Preset...)"
          "minsize 300 100, initialTitle:(UnityEditor.Snap.GridSettingsWindow)"
          "minsize 500 500, initialTitle:(UnityEngine.InputSystem.Editor.AdvancedDropdownWindow)"
          "minsize 300 200, initialTitle:(UnityEditor.IMGUI.Controls.AdvancedDropdownWindow)"
        ];

        general = {
          gaps_in = 5;
          gaps_out = 10;

          border_size = 2;

          "col.active_border" = "$mauve";
          "col.inactive_border" = "$surface1";

          resize_on_border = false;

          allow_tearing = false;

          layout = "dwindle";
        };

        decoration = {
          rounding = 10;

          active_opacity = 1.0;
          inactive_opacity = 1.0;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = "yes, please :)";

          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];

        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_status = "master";
        };

        cursor = {
          no_hardware_cursors = true;
        };

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "";
          kb_rules = "";

          follow_mouse = 1;

          sensitivity = 0;

          touchpad = {
            natural_scroll = false;
          };
        };

        gestures = {
          workspace_swipe = false;
        };

        device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        };
      };
  };
}
