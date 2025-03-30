import 'package:flutter/material.dart';
import 'package:portfolio_website_for_linkedin/constants/free_strings.dart';

class CircularAvatarWidget extends StatefulWidget {
  final double radiusCircle;
  const CircularAvatarWidget({super.key, this.radiusCircle=50});

  @override
  State<CircularAvatarWidget> createState() => _CircularAvatarWidgetState(this.radiusCircle);
}

class _CircularAvatarWidgetState extends State<CircularAvatarWidget> {
  final double radiusCircle;
  _CircularAvatarWidgetState(this.radiusCircle);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.greenAccent,
      radius: radiusCircle,
      backgroundImage: Image.network(
        imageUrl
      ).image,
      
    );
  }
}