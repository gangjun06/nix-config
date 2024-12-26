{
  pkgs,
  userConfig,
  config,
  ...
}: let
  inherit (userConfig) username;
in {
  services.jankyborders = {
    enable = true;
    package = pkgs.jankyborders;
    style = "round";
    width = 6.0;
    hidpi = false;
    active_color = "0xffcba6f7";
    inactive_color = "0xff45475a";
    # blacklist = "Arc";
  };

  environment.etc."sudoers.d/yabai".text = ''
    ${username} ALL = (root) NOPASSWD: ${pkgs.yabai}/bin/yabai --load-sa
  '';

  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      external_bar = "all:35:0";
      mouse_follows_focus = true;
      focus_follows_mouse = false;
      window_zoom_persist = false;
      window_placement = "second_child";
      window_shadow = "float";
      window_opacity = "off";
      window_opacity_duration = 0.0;
      active_window_opacity = 1.0;
      normal_window_opacity = 1.0;
      window_animation_duration = 0.3;
      split_ratio = 0.50;
      auto_balance = false;
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;
    };

    extraConfig = ''
      # reference - https://github.com/rayandrew/nix-config/blob/main/nix-darwin/yabai/default.nix
      wait4path /etc/sudoers.d/yabai
      sudo yabai --load-sa
      launchctl unload -F /System/Library/LaunchAgents/com.apple.WindowManager.plist > /dev/null 2>&1 &
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"


      # setup rules
      yabai -m rule --add app="^System Settings$" manage=off
      yabai -m rule --add app="^Calculator$" manage=off
      yabai -m rule --add app="^Karabiner-Elements$" manage=off
      yabai -m rule --add app="^DevUtils$" manage=off
      yabai -m rule --add app="Raycast" manage=off
      yabai -m rule --add app="TickTick" manage=off
      yabai -m rule --add app="DeepL" manage=off
      yabai -m rule --add app="Finder" manage=off
      yabai -m rule --add app="^Godot$" manage=off
      yabai -m rule --add app="DaysAI Analyzer" manage=off
      yabai -m rule --add app="CleanShot X" manage=off mouse_follows_focus=off
      yabai -m rule --add app="ChatGPT" manage=off mouse_follows_focus=off
      yabai -m rule --add app="qmk-display" manage=off

      # mark window as scratchpad using rule and set size (scratchpad windows are manage=off automatically)
      yabai -m rule --add app="^카카오톡$" scratchpad=kakaotalk
      yabai -m rule --add app="^Spotify$" scratchpad=spotify grid=11:11:1:1:9:9
      yabai -m rule --add app="^Discord$" title!="^Discord Updater$" scratchpad=discord grid=11:11:1:1:9:9
      yabai -m rule --add app="^Slack$" scratchpad=slack grid=11:11:1:1:9:9
      yabai -m rule --add app="^Akiflow$" title!="^Akiflow -" scratchpad=akiflow grid=11:11:1:1:9:9
      yabai -m rule --add app="^Linear$" scratchpad=linear grid=11:11:1:1:9:9
      yabai -m signal --add event=window_focused action="sketchybar --trigger window_focus"
      yabai -m signal --add event=window_created action="sketchybar --trigger windows_on_spaces"
      yabai -m signal --add event=window_destroyed action="sketchybar --trigger windows_on_spaces"
    '';
  };

  # # https://github.com/koekeishiya/yabai/issues/1880#issuecomment-1765074926
  # system.activationScripts.yabai-setup = {
  #   enable = true;
  #   text = ''
  #     #!/bin/bash

  #     # Get the SHA-256 hash of the yabai program
  #     YABAI_PATH=$(which yabai)
  #     if [ -z "$YABAI_PATH" ]; then
  #         echo "yabai not found!"
  #         exit 1
  #     fi
  #     HASH=$(shasum -a 256 "$YABAI_PATH" | awk '{print $1}')

  #     # Check if HASH is non-empty
  #     if [ -z "$HASH" ]; then
  #         echo "Failed to get hash for yabai!"
  #         exit 1
  #     fi

  #     # Construct the new sudoers entry
  #     SUDOERS_ENTRY="gangjun ALL=(root) NOPASSWD: sha256:$HASH $YABAI_PATH --load-sa"

  #     # Write the entry to /private/etc/sudoers.d/yabai
  #     echo "$SUDOERS_ENTRY" | sudo tee /private/etc/sudoers.d/yabai > /dev/null

  #     # Set the appropriate permissions for the sudoers file
  #     sudo chmod 0440 /private/etc/sudoers.d/yabai

  #     echo "Updated /private/etc/sudoers.d/yabai successfully!"
  #   '';
  # };
}
