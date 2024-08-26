import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          color: onPressed != null ? Colors.white24 : null,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 25), // แสดงไอคอนถ้ามี
                  const SizedBox(
                      width: 10), // เว้นระยะห่างระหว่างไอคอนกับข้อความ
                ],
                Text(
                  label,
                  style: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
