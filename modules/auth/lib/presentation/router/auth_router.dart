import 'package:flutter/material.dart';

abstract class AuthRouter {
  void onPushLogin(BuildContext context);

  void onPushActionMain(BuildContext context);

  void onPushRegister(BuildContext context);
}
