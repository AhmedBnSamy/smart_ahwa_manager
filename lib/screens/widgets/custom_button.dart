import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  final String label;
  final Widget destination;
  final Color color;
  final IconData? icon; // اختياري

  const NavigateButton({
    super.key,
    required this.label,
    required this.destination,
    this.color = Colors.blue,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(200, 60)
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min, // عشان الزرار يظبط نفسه على المقاس
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
