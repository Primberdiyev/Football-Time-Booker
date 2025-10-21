import 'package:auth/auth.dart';
import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.router,
  });
  final AuthRouter router;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      widget.router.onPushLogin(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.logo.image(),
      ),
    );
  }
}
