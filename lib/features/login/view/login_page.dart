import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:living_trends/core/widgets/primary_button.dart';
import 'package:living_trends/core/widgets/primary_textfield.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryTextField(
              hintText: 'Username or Email',
            ),
            PrimaryTextField(
              hintText: 'Password',
              isPassword: true,
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              label: 'Login',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
