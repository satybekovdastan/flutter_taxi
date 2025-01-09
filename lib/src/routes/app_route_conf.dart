import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:merphy/src/domain/entities/export_entities.dart';
import 'package:merphy/src/presentation/view/news_page.dart';

import '../../main.dart';
import '../presentation/view/news_detail_page.dart';
import 'app_route_path.dart';
import 'routes.dart';

class AppRouteConf {
  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: AppRoute.auth.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoute.auth.path,
        name: AppRoute.auth.name,
        builder: (_, __) => const NewsPage(),
        routes: [
          GoRoute(
            path: AppRoute.login.path,
            name: AppRoute.login.name,
            builder: (_, __) => const NewsPage(),
          ),
          GoRoute(
            path: AppRoute.register.path,
            name: AppRoute.register.name,
            builder: (_, __) => const NewsPage(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (_, state) {
          final params = state.pathParameters;
          // final user = UserEntity(
          //   username: params["username"],
          //   email: params["email"],
          //   userId: params["user_id"],
          // );

          return MyHomePage();
        },
      ),
      GoRoute(
        path: AppRoute.news.path,
        name: AppRoute.news.name,
        builder: (_, state) {
          final context = state.extra as BuildContext;
          return NewsPage();
        },
      ),
      GoRoute(
        path: AppRoute.detailNews.path,
        name: AppRoute.detailNews.name,
        builder: (_, state) {
          return NewsDetailPage(
            news: NewsEntity(),
          );
        },
      ),
    ],
  );
}
