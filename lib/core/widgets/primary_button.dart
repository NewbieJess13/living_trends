import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const PrimaryButton({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 60),
          backgroundColor: Color(0XFFFFFDD0)),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
