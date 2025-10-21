// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:navigation/wrappers/auth/login_page_wrapper.dart' as _i1;
import 'package:navigation/wrappers/auth/splash_page_wrapper.dart' as _i2;

/// generated route for
/// [_i1.LoginPageWrapper]
class LoginPageRoute extends _i3.PageRouteInfo<void> {
  const LoginPageRoute({List<_i3.PageRouteInfo>? children})
      : super(LoginPageRoute.name, initialChildren: children);

  static const String name = 'LoginPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginPageWrapper();
    },
  );
}

/// generated route for
/// [_i2.SplashPageWrapper]
class SplashPageRoute extends _i3.PageRouteInfo<void> {
  const SplashPageRoute({List<_i3.PageRouteInfo>? children})
      : super(SplashPageRoute.name, initialChildren: children);

  static const String name = 'SplashPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashPageWrapper();
    },
  );
}
