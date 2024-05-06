import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:hamzahllc/resources/my_routes.dart';
import 'package:hamzahllc/screens/articles/articles_imports.dart';
import 'package:hamzahllc/screens/articles_details/articles_details_imports.dart';
import 'package:hamzahllc/screens/login/login_imports.dart';
import 'package:hamzahllc/screens/register/register_imports.dart';
import 'package:hamzahllc/screens/splash/splash_imports.dart';

class AppNavigation {
  AppNavigation._();

  static final GoRouter router = GoRouter(
    initialLocation: "${MyRoutes.init}${MyRoutes.splash}",
    debugLogDiagnostics: true,
    observers: [
      BotToastNavigatorObserver(),
    ],
    routes: [
      GoRoute(
        path: "/${MyRoutes.login}",
        name: MyRoutes.login,
        builder: (context, state) => LoginScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: "/${MyRoutes.splash}",
        name: MyRoutes.splash,
        builder: (context, state) => SplashScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: "/${MyRoutes.register}",
        name: MyRoutes.register,
        builder: (context, state) => RegisterScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: "/${MyRoutes.articles}",
        name: MyRoutes.articles,
        builder: (context, state) => ArticlesScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: "/${MyRoutes.articlesDetails}",
        name: MyRoutes.articlesDetails,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ArticlesDetailsScreen(
            data: data['articlesModel'],
            key: state.pageKey,
          );
        },
      ),
    ],
  );
}
