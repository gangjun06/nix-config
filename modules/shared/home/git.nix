{...}: {
  programs.lazygit = {
    enable = true;
    
    settings = {
      os = {
        open = "nvim {{filename}}";
        edit = "nvim {{filename}}";
      };
    };
  };
}
