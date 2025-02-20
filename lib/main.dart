import 'package:attendence_app/screens/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendence App',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: backgroundColor,
      // ),
      home: LoginScreen(),
    );
  }
}
