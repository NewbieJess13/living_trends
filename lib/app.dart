import 'package:flutter/material.dart';
import 'package:living_trends/features/home/view/home_page.dart';
import 'package:living_trends/features/login/view/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: Color(0xFFF9E5B4),
          scaffoldBackgroundColor: Colors.white
          // scaffoldBackgroundColor: Color.fromARGB(255, 244, 243, 240)
          ),
      home: HomePage(),
    );
  }
}
