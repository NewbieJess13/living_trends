import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  const PrimaryTextField(
      {super.key, required this.hintText, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25)),
            fillColor: Color(0xFFF9E5B4),
            filled: true),
      ),
    );
  }
}
