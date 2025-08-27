import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 168,
            leading: CircleAvatar(),
            backgroundColor: const Color(0xFF20CFA3),
          ),
        ],
      ),
    );
  }
}
