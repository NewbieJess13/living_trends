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
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.1),
              blurRadius: 3,
              spreadRadius: .5,
              offset: Offset(3, 5))
        ]),
        child: TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)),
              fillColor: Colors.white,
              filled: true),
        ),
      ),
    );
  }
}
