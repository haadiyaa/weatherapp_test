import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/view/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Typography.whiteCupertino,
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      home:HomePageWrapper(),
    );
  }
}
