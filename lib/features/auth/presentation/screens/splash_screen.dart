import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onno/core/animations/splash_animator.dart';
import 'package:onno/core/utils/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final SplashAnimator animator;
  final Duration animationDuration = const Duration(seconds: 3);
  final Duration animationDelayDuration = const Duration(seconds: 2);

  final double widgetGapWG1 = 30;
  final double widgetGapWG2 = 50;

  late int screenWidth;
  late int screenHeight;

  final Map<String, String> assetsPath = {
    "backgroundImage": AssetsPath.screenBgWebp,
    "logoIcon": AssetsPath.onnoLogoSvg,
    "logoText": AssetsPath.onnoTextSvg,
  };

  final String subtitle = "A Curated Grocery Subscription Platform";

  List<Colors> gradientG1 = [];
  List<Colors> gradientG2 = [];
  List<Colors> gradientG3 = [];

  @override
  void initState() {
    super.initState();
    animator = SplashAnimator(vsync: this, duration: animationDuration);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(animationDelayDuration, () => animator.animate());
    });
  }

  @override
  void didChangeDependencies() {
    screenHeight = MediaQuery.of(context).size.height.toInt();
    screenWidth = MediaQuery.of(context).size.width.toInt();
    super.didChangeDependencies();
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
                ...splashScreenBackground(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        animatedLogoIcon(context, animator),
                        SizedBox(width: 20),
                        animatedLogoText(context, animator),
                      ],
                    ),
                    SizedBox(height: widgetGapWG1),
                    animator.getStatus()
                        ? subtitleWithShader()
                        : SizedBox(height: 30),
                    Spacer(),
                    animator.getStatus()
                        ? loginRegisterButtton(context)
                        : SizedBox(height: 50, width: 250),
                    SizedBox(height: widgetGapWG2),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ShaderMask subtitleWithShader() {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [Colors.blueAccent, Colors.green],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: SizedBox(
        height: 30,
        child: Text(subtitle, style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget loginRegisterButtton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          // width: 150,
          child: ElevatedButton(
            onPressed: () {
              context.goNamed("login");
            },
            child: const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
        SizedBox(width: 30),
        SizedBox(
          height: 50,
          // width: 150,
          child: ElevatedButton(
            onPressed: () {
              context.goNamed("registration");
            },
            child: const Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }

  Widget animatedLogoIcon(BuildContext context, SplashAnimator animator) {
    final screenHeight = MediaQuery.of(context).size.height;
    final slideupOffset = animator.logoIconSlide.value * screenHeight;

    return Transform.rotate(
      angle: animator.logoIconRotation.value,
      child: Opacity(
        opacity: animator.logoIconOpacity.value,
        child: Transform.translate(
          offset: slideupOffset,
          child: SizedBox(
            height: 120,
            width: 120,
            child: SvgPicture.asset(assetsPath["logoIcon"]!),
          ),
        ),
      ),
    );
  }

  Widget animatedLogoText(BuildContext context, SplashAnimator animator) {
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
            assetsPath["logoText"]!,
            width: 180,
            height: 60,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  List<Widget> splashScreenBackground() {
    return [
      Image.asset(
        assetsPath["backgroundImage"]!,
        fit: BoxFit.cover,
        cacheWidth: screenWidth,
        cacheHeight: screenHeight,
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          color: const Color.fromARGB(209, 255, 255, 255).withAlpha(140),
        ),
      ),
    ];
  }
}
