import 'package:flutter/material.dart';
import 'package:onno/core/routers/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "O N N O",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xFF3D5F3E)),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
