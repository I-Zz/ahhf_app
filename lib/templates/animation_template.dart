import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoAnimationScreen extends StatefulWidget {
  static const String id = '/logoanimation';
  @override
  _LogoAnimationScreenState createState() => _LogoAnimationScreenState();
}

class _LogoAnimationScreenState extends State<LogoAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  List<Color> colors = [
    Colors.blue.shade900,
    Colors.blue.shade600,
    Colors.blue.shade300,
    Colors.green.shade600,
    Colors.yellow.shade600,
    Colors.orange.shade700,
    Colors.pink.shade400,
    Colors.orange.shade700,
    Colors.yellow.shade600,
    Colors.green.shade600,
    Colors.blue.shade300,
    Colors.blue.shade600,
    Colors.blue.shade900,
  ];
  int _currentColorIndex = 0;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller with duration
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Create a tween animation for color
    _colorAnimation = TweenSequence(
      List.generate(
        colors.length,
        (index) {
          final color = colors[index];
          final startIndex = index / colors.length;
          final endIndex = (index + 1) / colors.length;
          return TweenSequenceItem<Color?>(
            tween: ColorTween(
              begin: color,
              end: colors[(index + 1) % colors.length],
            ).chain(
              CurveTween(
                curve:
                    Interval(startIndex, endIndex, curve: Curves.easeInCubic),
              ),
            ),
            // tween: ColorTween(
            //   begin: color,
            //   end: colors[(index + 1) % colors.length],
            // ),
            // curve: Interval(startIndex, endIndex, curve: Curves.linear),
            weight: 1 / colors.length,
          );
        },
      ),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(() {
        setState(() {
          _currentColorIndex = (_currentColorIndex + 1) % colors.length;
        });
      });

    // Start animation
    _controller.repeat();
  }

  @override
  void dispose() {
    // Dispose of animation controller when screen is closed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: colors,
            // stops: List.generate(
            //   colors.length,
            //   (index) => (index + 1) / colors.length,
            // ),
            // tileMode: TileMode.mirror,
            begin: Alignment(-_controller.value, 0),
            end: Alignment(1 - _controller.value, 0),
            tileMode: TileMode.mirror,
            transform: GradientRotation(0.20 * pi),
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: Image.asset(
          'assets/images/logo_final.png',
          width: 300,
          height: 300,
          colorBlendMode: BlendMode.modulate,
          filterQuality: FilterQuality.high,
          semanticLabel: 'Flutter Logo',
          color: _colorAnimation.value,
        ),
      ),
    );
  }
}
