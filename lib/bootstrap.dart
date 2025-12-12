import 'package:common_base/common_base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:football_time_booker/app.dart';

import 'firebase_options.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final CoreDiModule coreDiModule = CoreDiModule();
  await BaseDiModule.initDi(coreDiModule);
  await coreDiModule.get<LocalStorage>().initObjectBox();

  runApp(
    App(),
  );
}
