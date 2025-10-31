import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  final Size? size;
  const CircularLoader({super.key, this.size = const Size(35.0, 35.0)});

  @override
  Widget build(BuildContext context) {
    return ProgressIndicatorTheme(
      data: ProgressIndicatorThemeData(
        constraints: BoxConstraints(
          maxHeight: size!.height,
          maxWidth: size!.width,
        ),
      ),
      child: CircularProgressIndicator(),
    );
  }
}
