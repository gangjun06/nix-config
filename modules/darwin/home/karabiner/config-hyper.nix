{karabiner-lib}:
with karabiner-lib; {
  karabiner-config.hyper = {
    title = "(HYPER) CAPS_LOCK to Hyper/Escape; Hyper + i/j/k/l Vim navigation and others.";
    rules = [
      (mkBasicRule "(HYPER) CAPS_LOCK to HYPER (SHIFT+COMMAND+OPTION+CONTROL) or ESCAPE (If Alone)" [
        (mkManipulator {
          from.key_code = "caps_lock";
          to = wrapAsList {
            key_code = "left_shift";
            modifiers = ["left_command" "left_control" "left_option"];
          };
          to_if_alone = wrapAsList {
            key_code = "escape";
          };
        })
        (mkManipulator {
          description = "Avoid starting sysdiagnose with the built-in macOS shortcut cmd+shift+option+ctrl+;";
          from.key_code = "comma";
          from.modifiers.mandatory = ["command" "shift" "option" "control"];
          to = [];
        })
        (mkManipulator {
          description = "Avoid starting sysdiagnose with the built-in macOS shortcut cmd+shift+option+ctrl+.";
          from.key_code = "period";
          from.modifiers.mandatory = ["command" "shift" "option" "control"];
          to = [];
        })
        (mkManipulator {
          from.key_code = "slash";
          from.modifiers.mandatory = ["command" "shift" "option" "control"];
          to = [];
        })
      ])
      (mkBasicRule "(HYPER) Toggle caps_lock by pressing left_shift then right_shift" [
        (mkManipulator {
          from.key_code = "left_shift";
          from.modifiers.mandatory = ["right_shift"];
          from.modifiers.optional = ["caps_lock"];
          to = wrapAsList {
            key_code = "caps_lock";
          };
          to_if_alone = wrapAsList {
            key_code = "left_shift";
          };
        })
        (mkManipulator {
          from.key_code = "right_shift";
          from.modifiers.mandatory = ["left_shift"];
          from.modifiers.optional = ["caps_lock"];
          to = wrapAsList {
            key_code = "caps_lock";
          };
          to_if_alone = wrapAsList {
            key_code = "right_shift";
          };
        })
      ])
      (mkBasicRule "(HYPER) Hyper + i/j/k/l == vim directional Keys" [
        (mkManipulator {
          from.key_code = "k";
          from.modifiers.mandatory = ["left_shift" "left_command" "left_control" "left_option"];
          to = wrapAsList {
            key_code = "up_arrow";
          };
        })
        (mkManipulator {
          from.key_code = "h";
          from.modifiers.mandatory = ["left_shift" "left_command" "left_control" "left_option"];
          to = wrapAsList {
            key_code = "left_arrow";
          };
        })
        (mkManipulator {
          from.key_code = "j";
          from.modifiers.mandatory = ["left_shift" "left_command" "left_control" "left_option"];
          to = wrapAsList {
            key_code = "down_arrow";
          };
        })
        (mkManipulator {
          from.key_code = "l";
          from.modifiers.mandatory = ["left_shift" "left_command" "left_control" "left_option"];
          to = wrapAsList {
            key_code = "right_arrow";
          };
        })
        (mkManipulator {
          from.key_code = "semicolon";
          from.modifiers.mandatory = ["left_shift" "left_command" "left_control" "left_option"];
          to = wrapAsList {
            key_code = "right_arrow";
            modifiers = ["left_command"];
          };
        })
      ])
    ];
  };
}
