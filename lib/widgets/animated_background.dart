import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class AnimatedWidget extends StatefulWidget {
  const AnimatedWidget({super.key});

  @override
  State<AnimatedWidget> createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget> with SingleTickerProviderStateMixin{
  ParticleOptions particles = const ParticleOptions(
    baseColor: Color.fromARGB(255, 33, 233, 243),
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  @override

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

