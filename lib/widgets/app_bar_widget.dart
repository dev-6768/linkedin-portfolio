import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website_for_linkedin/themes/themes.dart';

class AppBarWidget extends StatelessWidget {
  final String appBarTitle;
  final Color? appBarColor;
  AppBarWidget(this.appBarTitle, this.appBarColor);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: TextStyle(
          fontFamily: GoogleFonts.calligraffitti().fontFamily,
          fontSize: 15.0,
        ),
      ),
      
      centerTitle: true,
      backgroundColor: appBarColor,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: MyThemeData.linearGradientProvider()
        ),
      ),
    );  
  }
}