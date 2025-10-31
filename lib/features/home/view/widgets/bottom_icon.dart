import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? size;
  final bool isCheckd;
  const BottomIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 28.0,
    required this.isCheckd,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          spacing: 2.0,
          children: [
            Icon(icon, size: size),
            Container(
              width: 6.0,
              height: 3.0,
              decoration: BoxDecoration(color: isCheckd ? Colors.red : null),
            ),
          ],
        ),
      ),
    );
  }
}
