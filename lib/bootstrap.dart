import 'package:common_base/common_base.dart';
import 'package:flutter/widgets.dart';
import 'package:football_time_booker/app.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final CoreDiModule coreDiModule = CoreDiModule();
  await BaseDiModule.initDi(coreDiModule);
  runApp(
    App(),
  );
}
