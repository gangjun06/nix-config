{
  pkgs,
  karabiner-lib,
  ...
}:
with karabiner-lib; let
  yabai = pkgs.yabai.outPath + "/bin/yabai";

  mkComboWithCmd = modifiers: key_codes: shell_command:
    mkManipulator {
      from.simultaneous = map (key_code: {key_code = key_code;}) key_codes;
      from.modifiers = {mandatory = modifiers;};
      to = wrapAsList {
        shell_command = shell_command;
      };
    };
in {
  title = "(QMK-WM) Window Manager config";
  rules = [
    (mkBasicRule "(QMK-WM) Default window manager config" [
      # Keyboard Left
      (mkComboWithCmd [] ["f13" "q"] "${yabai} -m space --balance")
      (mkComboWithCmd ["shift"] ["f13" "q"] "${yabai} -m space --mirror x-axis")
      (mkComboWithCmd ["option"] ["f13" "q"] "${yabai} -m space --mirror y-axis")

      (mkComboWithCmd [] ["f13" "w"] "${yabai} -m space --focus 7")
      (mkComboWithCmd ["shift"] ["f13" "w"] "${yabai} -m window --space 7")

      (mkComboWithCmd [] ["f13" "e"] "${yabai} -m space --focus 8")
      (mkComboWithCmd ["shift"] ["f13" "e"] "${yabai} -m window --space 8")

      (mkComboWithCmd [] ["f13" "r"] "${yabai} -m space --focus 9")
      (mkComboWithCmd ["shift"] ["f13" "r"] "${yabai} -m window --space 9")

      (mkComboWithCmd [] ["f13" "t"] "Workspace Setup 1")
      (mkComboWithCmd ["shift"] ["f13" "t"] "Workspace Setup 2")

      (mkComboWithCmd [] ["f13" "a"] "${yabai} -m display --focus 2")

      (mkComboWithCmd [] ["f13" "s"] "${yabai} -m space --focus 4")
      (mkComboWithCmd ["shift"] ["f13" "s"] "${yabai} -m window --space 4")

      (mkComboWithCmd [] ["f13" "d"] "${yabai} -m space --focus 5")
      (mkComboWithCmd ["shift"] ["f13" "d"] "${yabai} -m window --space 5")

      (mkComboWithCmd [] ["f13" "f"] "${yabai} -m space --focus 6")
      (mkComboWithCmd ["shift"] ["f13" "f"] "${yabai} -m window --space 6")

      (mkComboWithCmd [] ["f13" "g"] "${yabai} -m window --toggle float")

      (mkComboWithCmd [] ["f13" "z"] "${yabai} -m display --focus 1")

      (mkComboWithCmd [] ["f13" "x"] "${yabai} -m space --focus 1")
      (mkComboWithCmd ["shift"] ["f13" "x"] "${yabai} -m window --space 1")

      (mkComboWithCmd [] ["f13" "c"] "${yabai} -m space --focus 2")
      (mkComboWithCmd ["shift"] ["f13" "c"] "${yabai} -m window --space 2")

      (mkComboWithCmd [] ["f13" "v"] "${yabai} -m space --focus 3")
      (mkComboWithCmd ["shift"] ["f13" "v"] "${yabai} -m window --space 3")

      (mkComboWithCmd [] ["f13" "b"] "${yabai} -m window --toggle zoom-fullscreen")

      # Keyboard Right
      (mkComboWithCmd [] ["f13" "i"] "${yabai} -m window --focus stack.next")

      (mkComboWithCmd [] ["f13" "o"] "${yabai} -m window --focus stack.prev")

      (mkComboWithCmd [] ["f13" "h"] "${yabai} -m window --focus west")
      (mkComboWithCmd ["shift"] ["f13" "h"] "${yabai} -m window --swap west")
      (mkComboWithCmd ["option"] ["f13" "h"] "${yabai} -m window --stack west")

      (mkComboWithCmd [] ["f13" "j"] "${yabai} -m window --focus south")
      (mkComboWithCmd ["shift"] ["f13" "j"] "${yabai} -m window --swap south")
      (mkComboWithCmd ["option"] ["f13" "j"] "${yabai} -m window --stack south")

      (mkComboWithCmd [] ["f13" "k"] "${yabai} -m window --focus north")
      (mkComboWithCmd ["shift"] ["f13" "k"] "${yabai} -m window --swap north")
      (mkComboWithCmd ["option"] ["f13" "k"] "${yabai} -m window --stack north")

      (mkComboWithCmd [] ["f13" "l"] "${yabai} -m window --focus east")
      (mkComboWithCmd ["shift"] ["f13" "l"] "${yabai} -m window --swap east")
      (mkComboWithCmd ["option"] ["f13" "l"] "${yabai} -m window --stack east")

      (mkComboWithCmd [] ["f13" "n"] "${yabai} -m window --space 270")
      (mkComboWithCmd ["shift"] ["f13" "n"] "${yabai} -m window --space 90")

      (mkComboWithCmd [] ["f13" "m"] "${yabai} -m window --resize left:-150:0")
      (mkComboWithCmd ["shift"] ["f13" "m"] "${yabai} -m window --resize left:150:0")

      (mkComboWithCmd [] ["f13" "comma"] "${yabai} -m window --resize bottom:0:150")
      (mkComboWithCmd ["shift"] ["f13" "comma"] "${yabai} -m window --resize bottom:0:-150")

      (mkComboWithCmd [] ["f13" "period"] "${yabai} -m window --resize top:0:-150")
      (mkComboWithCmd ["shift"] ["f13" "period"] "${yabai} -m window --resize top:0:150")

      (mkComboWithCmd [] ["f13" "slash"] "${yabai} -m window --resize right:150:0")
      (mkComboWithCmd ["shift"] ["f13" "slash"] "${yabai} -m window --resize right:-150:0")
    ])
  ];
}
