import 'package:flutter/material.dart';

extension SnackBarEx on BuildContext {
  void showSnackBar({
    required String text,
    Color? color,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
      ),
    );
  }
}
