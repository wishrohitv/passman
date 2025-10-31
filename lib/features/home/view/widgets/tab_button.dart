import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const TabButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(icon,), Text(text)],
      ),
    );
  }
}
