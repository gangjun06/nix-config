{...}: {
  mkUserConfig = {
    username ? "gangjun",
    name ? "Kangjun Lee",
    email ? "me@gangjun.dev",
    home ? "/Users/gangjun",
    nixConfig ? "/Users/gangjun/nix",
  }: {
    inherit username name email home nixConfig;
  };
}
