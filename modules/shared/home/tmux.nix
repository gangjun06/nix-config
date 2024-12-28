# Theme config from https://github.com/catppuccin/tmux/discussions/317
{pkgs, ...}: let
  tmux-super-fingers =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-super-fingers";
      version = "2024-12-28";
      src = pkgs.fetchFromGitHub {
        owner = "artemave";
        repo = "tmux_super_fingers";
        rev = "2771f791a03880b3653c043cff48ee81db66212b";
        sha256 = "sha256-GnVlV8JRKVx6muVKYvqkCSMds7IBTYp1NFEgQnnuYEc=";
      };
    };
in {
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.nushell}/bin/nu";
    historyLimit = 100000;
    terminal = "tmux-256color";

    plugins = [
      # https://github.com/artemave/tmux_super_fingers
      {
        plugin = tmux-super-fingers;
        extraConfig = "set -g @super-fingers-key f";
      }

      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'

          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
          set -g @catppuccin_status_background "#242638"
          set -g @catppuccin_window_current_text " #{b:pane_current_path}"
          set -g @catppuccin_window_text " #{b:pane_current_path}"

        '';
      }

      # Recover tmux sessions.
      # leader + (ctrl + s)
      # leader + (ctrl + r)
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'

        '';
      }

      # Auto-save tmux sessions. using tmux-resurrect.
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }

      # Better mouse mode
      pkgs.tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D
      # Use Alt-arrow keys without prefix key to switch panes
      bind -n C-M-Left previous-window
      bind -n C-M-Right next-window
      bind -n C-M-Up split-window -h
      bind -n C-M-Down new-window

      # vi Copy mode
      setw -g mode-keys vi
      set -g alternate-screen on


      ### Theme config
      set -g status-style "bg=transparent"

      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left "#{E:@catppuccin_status_session}"
      set -g status-right "#{E:@catppuccin_status_application}"
      set -agF status-right "#{E:@catppuccin_status_weather}"
      set -agF status-right "#{E:@catppuccin_status_battery}"
      set-window-option -g status-position top
    '';
  };
}
