import 'package:flutter/material.dart';
import 'package:loginpage/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(resizeToAvoidBottomInset: false, body: SplashScreen()),
    );
  }
}
