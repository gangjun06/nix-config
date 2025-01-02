{
  pkgs,
  userConfig,
  ...
}: let
  yabai = pkgs.yabai.outPath + "/bin/yabai";
in {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      # For normal keyboard
      # ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

      # -- Focus to desktop --
      hyper - q: ${yabai} -m space --focus prev
      hyper - w: ${yabai} -m space --focus next

      hyper - 1: ${yabai} -m space --focus 1
      hyper - 2: ${yabai} -m space --focus 2
      hyper - 3: ${yabai} -m space --focus 3
      hyper - 4: ${yabai} -m space --focus 4
      hyper - 5: ${yabai} -m space --focus 5
      hyper - 6: ${yabai} -m space --focus 6
      hyper - 7: ${yabai} -m space --focus 7

      alt - 1: ${yabai} -m space --focus 1
      alt - 2: ${yabai} -m space --focus 2
      alt - 3: ${yabai} -m space --focus 3
      alt - 4: ${yabai} -m space --focus 4
      alt - 5: ${yabai} -m space --focus 5
      alt - 6: ${yabai} -m space --focus 6
      alt - 7: ${yabai} -m space --focus 7

      # -- Move window to desktop --
      shift + alt - 1: ${yabai} -m window --space 1;
      shift + alt - 2: ${yabai} -m window --space 2;
      shift + alt - 3: ${yabai} -m window --space 3;
      shift + alt - 4: ${yabai} -m window --space 4;
      shift + alt - 5: ${yabai} -m window --space 5;
      shift + alt - 6: ${yabai} -m window --space 6;
      shift + alt - 7: ${yabai} -m window --space 7;

      #  -- Focus to window --
      alt - j: ${yabai} -m window --focus south
      alt - k: ${yabai} -m window --focus north
      alt - h: ${yabai} -m window --focus west
      alt - l: ${yabai} -m window --focus east

      # -- Move window --
      shift + alt - j: ${yabai} -m window --swap south
      shift + alt - k: ${yabai} -m window --swap north
      shift + alt - h: ${yabai} -m window --swap west
      shift + alt - l: ${yabai} -m window --swap east

      # Move window to display
      shift + alt - s: ${yabai} -m window --display west; ${yabai} -m display --focus west;
      shift + alt - g: ${yabai} -m window --display east; ${yabai} -m display --focus east;

      # -- Modifying the Layout --

      # rotate layout clockwise
      shift + alt - r: ${yabai} -m space --rotate 270

      # flip along y-axis
      shift + alt - y: ${yabai} -m space --mirror y-axis

      # flip along x-axis
      shift + alt - x: ${yabai} -m space --mirror x-axis

      # toggle window float
      shift + alt - t: ${yabai} -m window --toggle float --grid 4:4:1:1:2:2

      # maximize a window
      shift + alt - m: ${yabai} -m window --toggle zoom-fullscreen

      # balance out tree of windows (resize to occupy same area)
      shift + alt - e: ${yabai} -m space --balance

      # -- move window to prev/next desktop --
      shift + alt - p: ${yabai} -m window --space prev;
      shift + alt - n: ${yabai} -m window --space next;

      # show all scratchpad windows if inaccessible due to yabai restart or crash
      cmd + alt - r: ${yabai} -m window --scratchpad recover

      # colmak m(usic)
      cmd + alt - m: ${yabai} -m window --toggle spotify || open  -a Spotify
      # colmak d(iscord)
      cmd + alt - d: ${yabai} -m window --toggle vesktop || open -a Vesktop
      # colmak k(akaotalk)
      cmd + alt - k: ${yabai} -m window --toggle kakaotalk || open -a KakaoTalk
      # colmak s(lack)
      cmd + alt - s: ${yabai} -m window --toggle slack || open -a Slack
      # colmak a(kiflow)
      cmd + alt - a: ${yabai} -m window --toggle akiflow || open -a Akiflow
      # colmak l(inear)
      cmd + alt - l: ${yabai} -m window --toggle linear || open -a Linear

      # colmak o(pen)
      cmd + alt - 0x29: ${yabai} -m window --toggle custom
      # colmak ; (register)
      cmd + alt - 0x23: ${yabai} -m window --scratchpad custom

      # colmak g(rid) set grid
      cmd + alt - g: ${yabai} -m window --grid 11:11:1:1:9:9

      # For custom keyboard
      # See https://github.com/gangjun06/keymaps
      # ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄

      # f13: ${yabai} -m space --focus 1
      # f14: ${yabai} -m space --focus 2
      # f15: ${yabai} -m space --focus 3
      # f16: ${yabai} -m space --focus 4
      # f17: ${yabai} -m space --focus 5
      # f18: ${yabai} -m space --focus 6
      # f19: ${yabai} -m space --focus 7
      # lalt - f13: ${yabai} -m space --focus 8
      # lalt - f14: ${yabai} -m space --focus 9
      # lalt - f15: ${yabai} -m space --focus 10

      # lalt - f16: ${yabai} -m window --focus west
      # lalt - f17: ${yabai} -m window --focus north
      # lalt - f18: ${yabai} -m window --focus south
      # lalt - f19: ${yabai} -m window --focus east

      # lalt - f20: ${yabai} -m display --focus west;
      # ctrl - f13: ${yabai} -m display --focus north;
      # ctrl - f14: ${yabai} -m display --focus south;
      # ctrl - f15: ${yabai} -m display --focus east;

      # ctrl - f16: ${yabai} -m window --resize abs:-20:0
      # ctrl - f17: ${yabai} -m window --resize abs:0:-20
      # ctrl - f18: ${yabai} -m window --resize abs:20:0
      # ctrl - f19: ${yabai} -m window --resize abs:0:20

      # ctrl - f20: ${yabai} -m space --focus prev
      # ctrl + alt - f13: ${yabai} -m space --focus next

      # ctrl + alt - f14: ${yabai} -m space --mirror x-axis
      # ctrl + alt - f15: ${yabai} -m space --mirror y-axis
      # ctrl + alt - f16: ${yabai} -m space --rotate 270
      # ctrl + alt - f17: ${yabai} -m window --toggle float --grid 4:4:1:1:2:2
      # ctrl + alt - f18: ${yabai} -m window --toggle zoom-fullscreen
      # ctrl + alt - f19: ${yabai} -m space --balance

      # shift - f13: ${yabai} -m window --space 1;
      # shift - f14: ${yabai} -m window --space 2;
      # shift - f15: ${yabai} -m window --space 3;
      # shift - f16: ${yabai} -m window --space 4;
      # shift - f17: ${yabai} -m window --space 5;
      # shift - f18: ${yabai} -m window --space 6;
      # shift - f19: ${yabai} -m window --space 7;
      # shift + alt - f13: ${yabai} -m window --space 8;
      # shift + alt - f14: ${yabai} -m window --space 9;
      # shift + alt - f15: ${yabai} -m window --space 10;

      # shift + alt - f16: ${yabai} -m window --swap west
      # shift + alt - f17: ${yabai} -m window --swap north
      # shift + alt - f18: ${yabai} -m window --swap south
      # shift + alt - f19: ${yabai} -m window --swap east

      # shift + alt - f20: ${yabai} -m window --display west; ${yabai} -m display --focus west;
      # shift + ctrl - f13: ${yabai} -m window --display north; ${yabai} -m display --focus north;
      # shift + ctrl - f14: ${yabai} -m window --display south; ${yabai} -m display --focus south;
      # shift + ctrl - f15: ${yabai} -m window --display east; ${yabai} -m display --focus east;

      # shift + ctrl - f16: ${yabai} -m window --resize abs:-20:0
      # shift + ctrl - f17: ${yabai} -m window --resize abs:0:-20
      # shift + ctrl - f18: ${yabai} -m window --resize abs:20:0
      # shift + ctrl - f19: ${yabai} -m window --resize abs:0:20

      # shift + ctrl - f20: ${yabai} -m window --space prev; ${yabai} -m display --focus prev;
      # shift + ctrl + alt - f13: ${yabai} -m window --space next; ${yabai} -m display --focus next;
    '';
  };
}
