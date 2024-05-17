import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website_for_linkedin/themes/themes.dart';
import 'package:portfolio_website_for_linkedin/widgets/text_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> with SingleTickerProviderStateMixin{
  ParticleOptions particles = const ParticleOptions(
    baseColor: Color.fromARGB(255, 17, 194, 210),
      spawnOpacity: 0.0,
      opacityChangeRate: 0.5,
      minOpacity: 0.1,
      maxOpacity: 0.8,
      particleCount: 150,
      spawnMaxRadius: 15.0,
      spawnMaxSpeed: 130.0,
      spawnMinSpeed: 50,
      spawnMinRadius: 7.0,
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: AnimatedBackground(
          vsync: this,
          behaviour: RacingLinesBehaviour(
            direction: LineDirection.Ltr,
            numLines: 500,
          ),
          child: Container(

        decoration: BoxDecoration(
          gradient: MyThemeData.linearGradientProvider()
          ),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: MyThemeData.linearGradientProvider()
              ), //BoxDecoration
              child: Container(
              decoration: BoxDecoration(
                gradient: MyThemeData.linearGradientProvider()
                
                ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: MyThemeData.linearGradientProvider()
                ),
                accountName: const Text(
                  "Sanidhya Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: const Text("sanidhyamishra1511@gmail.com"),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 102, 134, 236),
                  child: Text(
                    "S",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 8, 72, 125)
                    ),
                  ), //Text
                ), //circleAvatar
                ),
              ), 
            ),

            const Divider(
              height: 20,
              thickness: 5,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: MyThemeData.linearGradientProvider()
                ),


              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: [
                  ListTile(
                  leading: const Icon(Icons.person),
                  title: TextWidget("My Profile", GoogleFonts.lato().fontFamily, 15.0),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.book),
                  title: TextWidget("My Projects", GoogleFonts.lato().fontFamily, 15.0),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.pages),
                  title: TextWidget("My Resume", GoogleFonts.lato().fontFamily, 15.0),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.details),
                  title: TextWidget("Send Details", GoogleFonts.lato().fontFamily, 15.0),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ],
              ),
            ) //DrawerHeader
          ],
        ),
        ),

        ),
      ); //Drawer
  }
}