// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/auth.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:navigation/wrappers/action_main/action_main_page_wrapper.dart'
    as _i1;
import 'package:navigation/wrappers/action_main/home_page_wrapper.dart' as _i2;
import 'package:navigation/wrappers/action_main/statistics_page_wrapper.dart'
    as _i6;
import 'package:navigation/wrappers/auth/login_page_wrapper.dart' as _i3;
import 'package:navigation/wrappers/auth/splash_page_wrapper.dart' as _i5;

/// generated route for
/// [_i1.ActionMainPageWrapper]
class ActionMainPageRoute extends _i7.PageRouteInfo<void> {
  const ActionMainPageRoute({List<_i7.PageRouteInfo>? children})
      : super(ActionMainPageRoute.name, initialChildren: children);

  static const String name = 'ActionMainPageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.ActionMainPageWrapper();
    },
  );
}

/// generated route for
/// [_i2.HomePageWrapper]
class HomePageRoute extends _i7.PageRouteInfo<void> {
  const HomePageRoute({List<_i7.PageRouteInfo>? children})
      : super(HomePageRoute.name, initialChildren: children);

  static const String name = 'HomePageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePageWrapper();
    },
  );
}

/// generated route for
/// [_i3.LoginPageWrapper]
class LoginPageRoute extends _i7.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({
    _i8.Key? key,
    _i4.AuthDiModule module = const _i4.AuthDiModule(),
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginPageRoute.name,
          args: LoginPageRouteArgs(key: key, module: module),
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginPageRouteArgs>(
        orElse: () => const LoginPageRouteArgs(),
      );
      return _i3.LoginPageWrapper(key: args.key, module: args.module);
    },
  );
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key, this.module = const _i4.AuthDiModule()});

  final _i8.Key? key;

  final _i4.AuthDiModule module;

  @override
  String toString() {
    return 'LoginPageRouteArgs{key: $key, module: $module}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginPageRouteArgs) return false;
    return key == other.key && module == other.module;
  }

  @override
  int get hashCode => key.hashCode ^ module.hashCode;
}

/// generated route for
/// [_i5.SplashPageWrapper]
class SplashPageRoute extends _i7.PageRouteInfo<void> {
  const SplashPageRoute({List<_i7.PageRouteInfo>? children})
      : super(SplashPageRoute.name, initialChildren: children);

  static const String name = 'SplashPageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashPageWrapper();
    },
  );
}

/// generated route for
/// [_i6.StatisticsPageWrapper]
class StatisticsPageRoute extends _i7.PageRouteInfo<void> {
  const StatisticsPageRoute({List<_i7.PageRouteInfo>? children})
      : super(StatisticsPageRoute.name, initialChildren: children);

  static const String name = 'StatisticsPageRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.StatisticsPageWrapper();
    },
  );
}
