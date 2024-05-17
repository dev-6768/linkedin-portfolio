import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MyThemeData {

   static LinearGradient linearGradientProvider() {
    return const LinearGradient(
      colors: [
          Color.fromARGB(255, 70, 109, 225),
          Color.fromARGB(255, 49, 5, 154)
        ],

        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp  
    );
   }

   static LinearGradient linearGradientProviderGreen() {
    return const LinearGradient(
      colors: [
          Color.fromARGB(255, 40, 177, 49),
          Color.fromARGB(255, 252, 250, 250),
        ],

        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(1.0, 0.0),
        stops: [0.0, 2.5],
        tileMode: TileMode.clamp  
    );
   }

   static RadialGradient whiteGradient() {
    return const RadialGradient(
      colors: [
        Color.fromARGB(255, 240, 13, 13),
        Color.fromARGB(255, 108, 172, 225),
      ],

      center: Alignment.center,
      radius: 5.0
    );
   }

   static GradientText gradientTextProvider(String displayText, double fontSize, GradientType gradientType, String? googleFontFamily) {
    return GradientText(
      displayText,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: googleFontFamily,
      ),
      gradientType: gradientType,
      colors: [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 219, 199, 198),
      ],
    );
   }

   
   MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
   }

   ThemeData MyThemeDataForApp(BuildContext context) {
    ThemeData themeDataApp  = ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 38, 5, 135),
      canvasColor: Colors.blueAccent,
      primarySwatch: getMaterialColor(Color.fromARGB(255, 134, 133, 136)),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );  

    return themeDataApp;
   }
}