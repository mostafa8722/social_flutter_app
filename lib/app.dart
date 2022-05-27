import 'package:flutter/material.dart';
import 'package:social_flutter_app/screens/splash_screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: SplashScreen(),
    );
  }
}