{karabiner-lib}:
with karabiner-lib; {
  karabiner-config.qmk = {
    title = "(QMK) QMK Integration";
    rules = [
      (mkBasicRule "(QMK) Use Hyper+F9/F10/F11 to switch language." [
        (mkManipulator {
          from.key_code = "f9";
          from.modifiers.mandatory = ["command" "control" "option" "shift"];
          to = wrapAsList {
            shell_command = "/opt/homebrew/bin/macism org.youknowone.inputmethod.Gureum.han2";
          };
        })
        (mkManipulator {
          from.key_code = "f10";
          from.modifiers.mandatory = ["command" "control" "option" "shift"];
          to = wrapAsList {
            select_input_source.language = "en";
          };
        })
        (mkManipulator {
          from.key_code = "f11";
          from.modifiers.mandatory = ["command" "control" "option" "shift"];
          to = wrapAsList {
            select_input_source.input_mode_id = "com.apple.inputmethod.Japanese";
          };
        })
      ])
    ];
  };
}
