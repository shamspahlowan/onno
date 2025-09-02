import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:onno/core/utils/assets_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.height * 0.2;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.grey.shade50,
        selectedItemColor: Color.fromARGB(255, 52, 179, 147),
        unselectedItemColor: const Color(0xFF000000),
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        items: const [
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
        ],
        onTap: (value) {
          setState(() {});
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            stretch: true,
            pinned: true,
            floating: true,
            expandedHeight: expandedHeight,
            backgroundColor: const Color(0xFF20CFA3),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all(12),
              expandedTitleScale: 1.2,
              title: SizedBox(
                height: 40,
                child: SearchBar(
                  padding: WidgetStatePropertyAll(
                    EdgeInsetsGeometry.symmetric(horizontal: 12),
                  ),
                  hintText: 'Search products',
                  leading: const Icon(Icons.search),
                  onChanged: (query) {},
                  elevation: WidgetStateProperty.all(0),
                  backgroundColor: WidgetStateProperty.all(
                    const Color(0xFFF0F0F0),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              background: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      expandedLeading(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Icon(Icons.location_pin, size: 30),
                          Text(
                            "Dhaka, Bangladesh",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Jahangir Gate, Tejgaon.",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                padding: EdgeInsets.all(12),
                height: 140,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: Text("Promotional Banner Widget")),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Catagories", style: TextStyle(fontSize: 18)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(6),
                        height: 90,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(157, 197, 197, 197),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Center(child: Text("Grocery Catagory")),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Popular Products",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text("Product Items $index")),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget expandedLeading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Shams Pahlowan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("useful information", style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: IconButton(
            iconSize: 28,
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Color.fromARGB(188, 0, 0, 0),
            ),
          ),
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
