import 'package:auto_route/auto_route.dart';
import 'package:navigation/navigation.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Wrapper,Route',
)
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashPageRoute.page,
          initial: true,
          path: RouteNames.splash,
        ),
        AutoRoute(
          page: LoginPageRoute.page,
          path: RouteNames.login,
        ),
        AutoRoute(
          page: ActionMainPageRoute.page,
          path: RouteNames.actionMain,
          children: [
            AutoRoute(
              page: HomePageRoute.page,
              path: RouteNames.home,
            ),
            AutoRoute(
              page: StatisticsPageRoute.page,
              path: RouteNames.statistics,
            ),
          ],
        ),
      ];
}
