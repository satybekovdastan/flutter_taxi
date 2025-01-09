enum AppRoute {
  auth(path: "/auth"),
  login(path: "login"),
  register(path: "register"),
  home(path: "/home/:user_id/:email/:username"),
  news(path: "news"),
  detailNews(path: "/detail/:product_id");

  final String path;
  const AppRoute({required this.path});
}
