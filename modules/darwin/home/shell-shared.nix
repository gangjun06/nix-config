{
  pkgs,
  ...
}: {
  # Common shell aliases shared between zsh and fish
  shellAliases = {
    # Modern replacements
    ll = "eza -l --icons";
    la = "eza -la --icons";
    l = "eza -la --icons";
    lt = "eza --tree --icons";
    cat = "bat";
    top = "btop";
    
    # Editor aliases
    vi = "nvim";
    vim = "nvim";
    
    # Utility aliases
    c = "clear";
    lg = "lazygit";
    
    # Navigation aliases
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    
    # Git aliases (basic ones, more complex ones can go in git config)
    g = "git";
    ga = "git add";
    gc = "git commit";
    gst = "git status";
    gp = "git push";
    gl = "git pull";
    gco = "git checkout";
    gb = "git branch";
    gd = "git diff";
    glog = "git log --oneline --graph --decorate";
  };
}