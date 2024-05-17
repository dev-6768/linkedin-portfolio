import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website_for_linkedin/pages/home_page_widget.dart';
import 'package:portfolio_website_for_linkedin/themes/themes.dart';
import 'package:portfolio_website_for_linkedin/widgets/animated_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/button_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/circular_avatar_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/grid_layout_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/responsive_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/text_widget.dart';
import 'package:portfolio_website_for_linkedin/widgets/app_bar_widget.dart';
import 'package:portfolio_website_for_linkedin/constants/free_strings.dart';
import 'package:portfolio_website_for_linkedin/widgets/textfield_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class HomePage extends StatefulWidget {

  const HomePage ({super.key});

  @override
  State<HomePage > createState() => _HomePageState();
}

class _HomePageState extends State<HomePage > with SingleTickerProviderStateMixin{
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("Portfolio", Color.fromARGB(255, 134, 137, 240)).build(context),

      body: Center(
        child: const ResponsiveWidget(
            largeScreen: HomePageLargeBody(),
            mediumScreen: HomePageLargeBody(),
            smallScreen: HomePageLargeBody(),
          ),
      ),
    );
  }
}