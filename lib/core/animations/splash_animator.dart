import 'dart:math' show pi;
import 'package:flutter/animation.dart';

class SplashAnimator {
  // for the controller settings
  final TickerProvider vsync;
  final Duration duration;

  // the controller itself
  late final AnimationController controller;

  // animations related to the logo icon
  late final Animation<double> logoIconOpacity;
  late final Animation<double> logoIconRotation;
  late final Animation<Offset> logoIconSlide;
  late final Animation<Offset> logoIconShift;

  // animations related to the logo text
  late final Animation<double> logoTextOpacity;
  late final Animation<double> logoTextReveal;

  SplashAnimator({required this.vsync, required this.duration}) {
    controller = AnimationController(vsync: vsync, duration: duration);

    logoIconOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    logoIconRotation = Tween<double>(begin: 0.0, end: 1.0 * pi).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5, curve: Curves.easeInOut),
      ),
    );

    // logoIconShift = Tween<Offset>(
    //   begin: Offset(0, 0),
    //   end: Offset(-0.3, 0.0),
    // ).animate(
    //   CurvedAnimation(
    //     parent: controller,
    //     curve: const Interval(0.6, 0.75, curve: Curves.easeInOut),
    //   ),
    // );

    logoIconSlide = Tween<Offset>(
      begin: Offset(0.0, 0.1),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeInOut),
      ),
    );

    logoTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    );

    logoTextReveal = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  bool getStatus() =>
      (controller.status == AnimationStatus.completed) ? true : false;

  void animate() => controller.forward();

  void dispose() => controller.dispose();
}
