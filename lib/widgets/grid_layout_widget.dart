import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website_for_linkedin/themes/themes.dart';
import 'package:portfolio_website_for_linkedin/widgets/animated_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/helper_widgets.dart';
import 'package:portfolio_website_for_linkedin/widgets/responsive_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:portfolio_website_for_linkedin/constants/free_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class GridLayoutWidget extends StatefulWidget {
  final List<Widget> itemList;
  GridLayoutWidget(this.itemList);

  @override
  State<GridLayoutWidget> createState() => _GridLayoutWidgetState(itemList);
}

class _GridLayoutWidgetState extends State<GridLayoutWidget> {
  final List<Widget> itemList;
  _GridLayoutWidgetState(this.itemList);

  int countGridObjects = 0;
  int changeCounterGridObjects() {
    setState(() {
      if(ResponsiveWidget.isLargeScreen(context)){
        countGridObjects = 3;
      }

      else if(ResponsiveWidget.isMediumScreen(context)) {
        countGridObjects = 2;
      }

      else if(ResponsiveWidget.isSmallScreen(context)) {
        countGridObjects = 1;
      }

      
    });
    return countGridObjects;
  }

  @override
  Widget build(BuildContext context) {

    double height = 0;
    if(itemList == codeList) {
      height = MediaQuery.of(context).size.height*0.55; 
    }
    else if(itemList == projectList) {
      height = MediaQuery.of(context).size.height*0.9; 
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: height,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: changeCounterGridObjects()),
        children: itemList,
      ),
    );
  }
}

class ContainerForGridLayout extends StatefulWidget {
  final String headingText;
  final String containerText;
  final String redirection;

  ContainerForGridLayout(this.headingText, this.containerText, this.redirection);

  @override
  State<ContainerForGridLayout> createState() => _ContainerForGridLayoutState(this.headingText, this.containerText, this.redirection);
}

class _ContainerForGridLayoutState extends State<ContainerForGridLayout> {
  final String headingText;
  final String containerText;
  final String redirection;

  _ContainerForGridLayoutState(this.headingText, this.containerText, this.redirection);

  double headingFont = 0;
  double bodyFont = 0;

  List<double> changeCounterGridObjects() {
    setState(() {
      if(ResponsiveWidget.isLargeScreen(context)){
        headingFont = 25;
        bodyFont = 15;
      }

      else if(ResponsiveWidget.isMediumScreen(context)) {
        headingFont = 22;
        bodyFont = 12;
      }

      else if(ResponsiveWidget.isSmallScreen(context)) {
        headingFont = 18;
        bodyFont = 10;
      }

      
    });
    return [headingFont, bodyFont];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () async {
      if(await canLaunchUrl(Uri.parse(redirection))) {
        await launchUrl(Uri.parse(redirection));
      }

      else {
        UtilFunctions.flutterToastFunction("Could not open URL. Please Try Again Later");
      }
    },

    child: OnHoverAnimation(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 50.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
      decoration: BoxDecoration(
        gradient: MyThemeData.linearGradientProvider(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: MyThemeData.gradientTextProvider(
            headingText,
            changeCounterGridObjects()[0], 
            GradientType.linear, 
            GoogleFonts.lato().fontFamily
          )
        ),

        const SizedBox(height: 20),

        Align(
          alignment: Alignment.topLeft,
          child: MyThemeData.gradientTextProvider(
            containerText, 
            changeCounterGridObjects()[1], 
            GradientType.linear, 
            GoogleFonts.lato().fontFamily,
          ),
        ),
        
        const SizedBox(height: 30),
        
        Align(
          alignment: Alignment.bottomRight,
          child: MyThemeData.gradientTextProvider(
            "Read More >", 
            changeCounterGridObjects()[1], 
            GradientType.linear, 
            GoogleFonts.lato().fontFamily,
          ),
        ),
      ],
      ),
    ),   
    ),
    ),
    ),
    );
  }
}
class ContainerForBackgroundWidget extends StatefulWidget {
  final String urlString;
  final String redirection;
  ContainerForBackgroundWidget(this.urlString, this.redirection);

  @override
  State<ContainerForBackgroundWidget> createState() => _ContainerForBackgroundWidgetState(urlString, redirection);
}

class _ContainerForBackgroundWidgetState extends State<ContainerForBackgroundWidget> {
  final String urlString;
  final String redirection;

  _ContainerForBackgroundWidgetState(this.urlString, this.redirection);
  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () async {
      if(await canLaunchUrl(Uri.parse(redirection))) {
        await launchUrl(Uri.parse(redirection));
      }

      else {
        UtilFunctions.flutterToastFunction("Could not open URL. Please Try Again Later.");
      }
    },
    child: OnHoverAnimation(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 50.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
      decoration: BoxDecoration(
        gradient: MyThemeData.linearGradientProvider(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Image.network(urlString, fit: BoxFit.fill),
    ),   
    ),
    ),
    ),
    );
  }
}