
import 'package:flutter/material.dart';
import 'package:social_flutter_app/screens/login/login_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home/home_screen.dart';


class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SplashScreenView(
        navigateRoute:LoginScreen() ,
        text: "Social Media App",
        imageSrc: "assets/images/mountains.jpg",
        textStyle: TextStyle(fontFamily: "Signatra",fontSize: 40,letterSpacing: 10.0),
        textType: TextType.TyperAnimatedText,
        duration: 3000,
        colors: [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
      ),
    );
  }
}