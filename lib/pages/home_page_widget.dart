import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website_for_linkedin/widgets/button_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/responsive_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../constants/free_strings.dart';
import '../themes/themes.dart';
import '../widgets/animated_widget.dart';
import '../widgets/circular_avatar_widget.dart';
import '../widgets/grid_layout_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/textfield_widget.dart';

class HomePageLargeBody extends StatefulWidget {
  const HomePageLargeBody({super.key});

  @override
  State<HomePageLargeBody> createState() => _HomePageLargeBodyState();
}

class _HomePageLargeBodyState extends State<HomePageLargeBody> with SingleTickerProviderStateMixin {
  ParticleOptions particles = const ParticleOptions(
    baseColor: Color.fromARGB(255, 17, 194, 210),
    spawnOpacity: 0.0,
    opacityChangeRate: 0.5,
    minOpacity: 0.1,
    maxOpacity: 0.8,
    particleCount: 200,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  double mainHeading = 0;
  double secondaryHeading = 0;
  double bodyFont = 0;
  double circleAvatarRadius = 0;


  List<double> fontSizeAllocationFunction() {
    setState(() {
      if(ResponsiveWidget.isLargeScreen(context)) {
        mainHeading = 40.0;
        secondaryHeading = 40.0;
        bodyFont = 15.0;
        circleAvatarRadius = 100.0;
      }

      else if(ResponsiveWidget.isMediumScreen(context)) {
        mainHeading = 30.0;
        secondaryHeading = 30.0;
        bodyFont = 12.0;
        circleAvatarRadius = 80.0;
      }

      else if(ResponsiveWidget.isSmallScreen(context)) {
        mainHeading = 20.0;
        secondaryHeading = 20.0;
        bodyFont = 10.0;
        circleAvatarRadius = 50.0;
      }
    });
    return [mainHeading, secondaryHeading, bodyFont, circleAvatarRadius];
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
        vsync: this, 
        behaviour: RandomParticleBehaviour(options: particles),
        child: Center(
        child: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: [
                SizedBox(height: 10),

                Center(
                  child: MyThemeData.gradientTextProvider(headingGreeting, fontSizeAllocationFunction()[0], GradientType.linear, GoogleFonts.lato().fontFamily),
                ),

                const SizedBox(height: 10),

                Center(
                  child: CircularAvatarWidget(
                    radiusCircle: fontSizeAllocationFunction()[3],
                  ),
                ),

                SizedBox(height: 10),

                Center(
                  child:TextWidget(
                    homeGreeting, GoogleFonts.calligraffitti().fontFamily, fontSizeAllocationFunction()[2]
                  ),
                ),

                SizedBox(height: 10),

                Center(
                  child: TextWidget(
                    "About Me",
                    GoogleFonts.calligraffitti().fontFamily,
                    fontSizeAllocationFunction()[0]/2, 
                  ),
                ),

                Center(
                    child:TextWidget(
                      aboutMeSectionString, GoogleFonts.calligraffitti().fontFamily, fontSizeAllocationFunction()[2]
                    ),
                  ),

                SizedBox(height: 10),

                Center(
                  child: TextWidget(skillsSection, GoogleFonts.calligraffitti().fontFamily, fontSizeAllocationFunction()[2]),
                ),

                SizedBox(height: 100),

                Center(
                  child: TextWidget(projectsSection, GoogleFonts.calligraffitti().fontFamily, fontSizeAllocationFunction()[2]),
                ),

                SizedBox(height: 10),

                Center(
                  child: TextWidget(experienceSection, GoogleFonts.calligraffitti().fontFamily, fontSizeAllocationFunction()[2]),
                ),

                SizedBox(height: 10),

                Center(
                  child: TextWidget(educationSection, GoogleFonts.calligraffitti().fontFamily, fontSizeAllocationFunction()[2]),
                ),

                SizedBox(height: 10),

                Center(
                  child: TextWidget(contactSection, GoogleFonts.calligraffitti().fontFamily, fontSizeAllocationFunction()[2]),
                ),

                const SizedBox(height: 20),

                Center(
                  child: MyThemeData.gradientTextProvider("My Projects", fontSizeAllocationFunction()[0], GradientType.linear, GoogleFonts.lato().fontFamily),
                ),

                const SizedBox(height: 20),

                Center(
                  child: GridLayoutWidget(projectList),
                ),

                const SizedBox(height: 20),
                
                Center(
                  child: GridLayoutWidget(codeList),
                ),

                const SizedBox(height: 20),

                Center(
                  child: MyThemeData.gradientTextProvider("My Resume", fontSizeAllocationFunction()[0], GradientType.linear, GoogleFonts.lato().fontFamily),
                ),

                const SizedBox(height: 20),

                const Center(
                  child: OnHoverAnimation(
                    child: ButtonContainer(),
                  )
                ),

                const SizedBox(height: 20),

                Center(
                  child: MyThemeData.gradientTextProvider("Drop a Message !", fontSizeAllocationFunction()[0]/2, GradientType.linear, GoogleFonts.lato().fontFamily),
                ),

                const SizedBox(height: 20),

                const Center(
                  child: TextfieldWidget(),
                ),

                const SizedBox(height: 20),

                const Divider(
                  height: 20,
                  thickness: 5,
                  color: Colors.white,
                ),

                Center(
                  child: TextWidget(
                    "Copyright c. 2024 Sanidhya Mishra. All Rights Reserved.",
                    GoogleFonts.lato().fontFamily,
                    fontSizeAllocationFunction()[2],
                  )
                ),
              ],
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