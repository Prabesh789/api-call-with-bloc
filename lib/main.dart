import 'package:apicallwithbloc/app_init.dart';
import 'package:apicallwithbloc/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppInit.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
