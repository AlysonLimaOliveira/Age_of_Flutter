import 'package:flutter/material.dart';

class RPGButton extends StatelessWidget {
  final String label;  final VoidCallback onPressed;
  final Color color;

  const RPGButton({super.key, required this.label, required this.onPressed, this.color = Colors.brown});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5, offset: const Offset(2, 4))
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.amber, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}