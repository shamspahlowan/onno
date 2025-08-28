import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: true,
            expandedHeight: 178,
            backgroundColor: const Color(0xFF20CFA3),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  height: 35,
                  child: SearchBar(
                    padding: WidgetStatePropertyAll(
                      EdgeInsetsGeometry.symmetric(horizontal: 12),
                    ),
                    elevation: WidgetStatePropertyAll(0),
                    hintText: "search products",
                    trailing: [Icon(Icons.search_rounded)],
                  ),
                ),
              ),
              background: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    expandedLeading(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_pin),
                        Text("Dhaka, Bangladesh"),
                      ],
                    ),
                    const Text("Jahangir Gate, Tejgaon."),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                itemCount: 100,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(child: Text(index.toString())),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget expandedLeading() {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: ClipOval(child: Image.asset("assets/user.png")),
          ),
        ),
        const SizedBox(width: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Shams Pahlowan",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Text("usefull information", style: TextStyle(fontSize: 14)),
          ],
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  List<Widget> locationWidget() {
    return [
      Row(
        children: const [Icon(Icons.location_pin), Text("Dhaka, Bangladesh")],
      ),
      const Text("Jahangir Gate, Tejgaon."),
    ];
  }
}
