{...}: {
  mkUserConfig = {
    username ? "gangjun",
    name ? "Kangjun Lee",
    email ? "me@gangjun.dev",
    home ? "/Users/gangjun",
  }: {
    inherit username name email home;
  };
}
