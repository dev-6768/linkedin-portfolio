import 'package:flutter/material.dart';
import 'themes/themes.dart';
import 'constants/string_resource.dart';
import 'pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemeData().MyThemeDataForApp(context),
      
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.light
      ),

      debugShowCheckedModeBanner: false,

      initialRoute: "/home",

      routes: {
        homeRoute:(context) => HomePage(),
      }
    );
  }
}

