import 'package:flutter/material.dart';
import 'package:onno/features/auth/presentation/screens/login_screen.dart';
import 'package:onno/features/auth/presentation/screens/registration_screen.dart';
import 'package:onno/features/auth/presentation/screens/splash_screen.dart';
import 'package:onno/features/product_browsing/presentation/home_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<BottomNavigationBarItem> bottomPages = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home_rounded),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.space_dashboard_outlined),
      activeIcon: Icon(Icons.space_dashboard_rounded),
      label: "Explore",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      activeIcon: Icon(Icons.shopping_cart_rounded),
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.inventory_2_outlined),
      activeIcon: Icon(Icons.inventory_2_rounded),
      label: "Orders",
    ),
  ];

  List<Widget> pages = [
    HomeScreen(),
    LoginScreen(),
    RegistrationScreen(),
    SplashScreen(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        backgroundColor: Colors.grey.shade50,
        selectedItemColor: Color.fromARGB(255, 52, 179, 147),
        unselectedItemColor: const Color(0xFF000000),
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        items: bottomPages,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
      ),
      body: IndexedStack(index: currentPageIndex, children: pages),
    );
  }
}
