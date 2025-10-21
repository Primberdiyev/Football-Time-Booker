import 'package:flutter/material.dart';

class ShowLoader extends StatelessWidget {
  const ShowLoader({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
