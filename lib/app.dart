import 'package:auto_route/auto_route.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    this.coreDiModule = const CoreDiModule(),
  });
  final CoreDiModule coreDiModule;
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = widget.coreDiModule.get<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    final delegate = _appRouter.delegate();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(delegate.controller),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routeInformationProvider: _appRouter.routeInfoProvider(),
      localizationsDelegates: AppLocalizations.delegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        extensions: [
          lightThemeExtension,
        ],
        scaffoldBackgroundColor:
            lightThemeExtension.colors.backgroundColors.scaffoldColor,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
