// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/auth.dart' as _i5;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:home/home.dart' as _i3;
import 'package:navigation/wrappers/action_main/action_main_page_wrapper.dart'
    as _i1;
import 'package:navigation/wrappers/action_main/home_page_wrapper.dart' as _i2;
import 'package:navigation/wrappers/action_main/statistics_page_wrapper.dart'
    as _i8;
import 'package:navigation/wrappers/auth/login_page_wrapper.dart' as _i4;
import 'package:navigation/wrappers/auth/register_page_wrapper.dart' as _i6;
import 'package:navigation/wrappers/auth/splash_page_wrapper.dart' as _i7;

/// generated route for
/// [_i1.ActionMainPageWrapper]
class ActionMainPageRoute extends _i9.PageRouteInfo<void> {
  const ActionMainPageRoute({List<_i9.PageRouteInfo>? children})
      : super(ActionMainPageRoute.name, initialChildren: children);

  static const String name = 'ActionMainPageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.ActionMainPageWrapper();
    },
  );
}

/// generated route for
/// [_i2.HomePageWrapper]
class HomePageRoute extends _i9.PageRouteInfo<HomePageRouteArgs> {
  HomePageRoute({
    _i10.Key? key,
    _i3.HomeDiModule module = const _i3.HomeDiModule(),
    List<_i9.PageRouteInfo>? children,
  }) : super(
          HomePageRoute.name,
          args: HomePageRouteArgs(key: key, module: module),
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomePageRouteArgs>(
        orElse: () => const HomePageRouteArgs(),
      );
      return _i2.HomePageWrapper(key: args.key, module: args.module);
    },
  );
}

class HomePageRouteArgs {
  const HomePageRouteArgs({this.key, this.module = const _i3.HomeDiModule()});

  final _i10.Key? key;

  final _i3.HomeDiModule module;

  @override
  String toString() {
    return 'HomePageRouteArgs{key: $key, module: $module}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomePageRouteArgs) return false;
    return key == other.key && module == other.module;
  }

  @override
  int get hashCode => key.hashCode ^ module.hashCode;
}

/// generated route for
/// [_i4.LoginPageWrapper]
class LoginPageRoute extends _i9.PageRouteInfo<LoginPageRouteArgs> {
  LoginPageRoute({
    _i10.Key? key,
    _i5.AuthDiModule module = const _i5.AuthDiModule(),
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginPageRoute.name,
          args: LoginPageRouteArgs(key: key, module: module),
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginPageRouteArgs>(
        orElse: () => const LoginPageRouteArgs(),
      );
      return _i4.LoginPageWrapper(key: args.key, module: args.module);
    },
  );
}

class LoginPageRouteArgs {
  const LoginPageRouteArgs({this.key, this.module = const _i5.AuthDiModule()});

  final _i10.Key? key;

  final _i5.AuthDiModule module;

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
/// [_i6.RegisterPageWrapper]
class RegisterPageRoute extends _i9.PageRouteInfo<void> {
  const RegisterPageRoute({List<_i9.PageRouteInfo>? children})
      : super(RegisterPageRoute.name, initialChildren: children);

  static const String name = 'RegisterPageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.RegisterPageWrapper();
    },
  );
}

/// generated route for
/// [_i7.SplashPageWrapper]
class SplashPageRoute extends _i9.PageRouteInfo<SplashPageRouteArgs> {
  SplashPageRoute({
    _i10.Key? key,
    _i5.AuthDiModule module = const _i5.AuthDiModule(),
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SplashPageRoute.name,
          args: SplashPageRouteArgs(key: key, module: module),
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashPageRouteArgs>(
        orElse: () => const SplashPageRouteArgs(),
      );
      return _i7.SplashPageWrapper(key: args.key, module: args.module);
    },
  );
}

class SplashPageRouteArgs {
  const SplashPageRouteArgs({this.key, this.module = const _i5.AuthDiModule()});

  final _i10.Key? key;

  final _i5.AuthDiModule module;

  @override
  String toString() {
    return 'SplashPageRouteArgs{key: $key, module: $module}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplashPageRouteArgs) return false;
    return key == other.key && module == other.module;
  }

  @override
  int get hashCode => key.hashCode ^ module.hashCode;
}

/// generated route for
/// [_i8.StatisticsPageWrapper]
class StatisticsPageRoute extends _i9.PageRouteInfo<void> {
  const StatisticsPageRoute({List<_i9.PageRouteInfo>? children})
      : super(StatisticsPageRoute.name, initialChildren: children);

  static const String name = 'StatisticsPageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.StatisticsPageWrapper();
    },
  );
}
