import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onno/core/animations/splash_animator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final SplashAnimator animator;

  @override
  void initState() {
    super.initState();
    animator = SplashAnimator(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animator.animate();
  }

  @override
  void dispose() {
    super.dispose();
    animator.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animator.controller,
        builder: (_, _) {
          return Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/jpgs/ecommerceBackgroundImage.jpg",
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(color: Colors.black12.withAlpha(80)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        animatedLogoIcon(context, animator),
                        SizedBox(width: 10),
                        animatedLogoText(context, animator),
                      ],
                    ),
                    SizedBox(height: 280),
                    animator.getStatus()
                        ? continueButton(context)
                        : SizedBox(height: 50, width: 250),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget continueButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          context.go("/login");
        },
        child: const Text(
          "Continue -->",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }

  Widget animatedLogoIcon(BuildContext context, SplashAnimator animator) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final leftShiftOffset = animator.logoIconShift.value * screenWidth;
    final slideupOffset = animator.logoIconSlide.value * screenHeight;
    // final totalOffset = leftShiftOffset + slideupOffset;

    return Transform.rotate(
      angle: animator.logoIconRotation.value,
      child: Opacity(
        opacity: animator.logoIconOpacity.value,
        child: Transform.translate(
          offset: slideupOffset,
          child: SizedBox(
            height: 120,
            width: 120,
            child: SvgPicture.asset("assets/svgs/onno_logo.svg"),
          ),
        ),
      ),
    );
  }

  Widget animatedLogoText(BuildContext context, SplashAnimator animator) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final widthFactor = animator.logoTextReveal.value;

    return ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: widthFactor,
        child: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [Color(0xFF2A7B9B), Color(0xFF57C785)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: SvgPicture.asset(
            'assets/svgs/onno_text.svg',
            width: 180,
            height: 60,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
