import 'package:flutter/material.dart';
import 'package:staggered_animations/home_page.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
