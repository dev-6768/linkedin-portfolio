import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website_for_linkedin/constants/free_strings.dart';
import 'package:portfolio_website_for_linkedin/themes/themes.dart';
import 'package:portfolio_website_for_linkedin/widgets/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonContainer extends StatefulWidget {
  const ButtonContainer({super.key});

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  double buttonSize = 0;
  List<double> fontSizeController() {
    setState(() {
      if(ResponsiveWidget.isLargeScreen(context)) {
        buttonSize = 40;
      }

      else if(ResponsiveWidget.isMediumScreen(context)) {
        buttonSize = 30;
      }
      
      else if(ResponsiveWidget.isSmallScreen(context)) {
        buttonSize = 20;
      }
    });

    return [buttonSize];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.6,
      height: MediaQuery.of(context).size.height*0.2,
      decoration: BoxDecoration(
        gradient: MyThemeData.linearGradientProvider(),
        borderRadius: BorderRadius.circular(50.0),
      ),

        child: InkWell(
          onTap: () async {
            if(await canLaunchUrl(Uri.parse(resumeUrl))) {
              await launchUrl(Uri.parse(resumeUrl));
            }
          },

          child: Center(
            child: Text(
              "View Resume",
              style: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: fontSizeController()[0],
                color: Colors.white,
              ),
          ),
          
          ),
        ),
      );
  }
}