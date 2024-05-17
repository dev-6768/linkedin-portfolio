import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String animatedText;
  AnimatedTextWidget(this.animatedText);

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState(this.animatedText);
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  final String animatedText;
  _AnimatedTextWidgetState(this.animatedText);
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1,
      displayFullTextOnTap: true,
      animatedTexts: [
        TyperAnimatedText(animatedText, 
          textStyle: TextStyle(
            fontFamily: GoogleFonts.calligraffitti().fontFamily,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ],
    );
  }
}

class OnHoverAnimation extends StatefulWidget {
  final Widget child;

  const OnHoverAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<OnHoverAnimation> createState() => _OnHoverAnimationState();
}

class _OnHoverAnimationState extends State<OnHoverAnimation> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(0.9);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.child,
      ),
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
    );
      
  }

  void onEntered(bool isHovered) => setState(() {
    this.isHovered = isHovered;
  });
}
