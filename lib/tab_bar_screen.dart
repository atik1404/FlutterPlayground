import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Listen to tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        print("Selected Tab Index: ${_tabController.index}");
      }
    });

    // Listen to animation for smooth position tracking
    _tabController.animation?.addListener(() {
      print("Tab Animation Value: ${_tabController.animation?.value}");
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // TabBar with equal size for all tabs
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white, // Background for selected tab
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  onTap: (index)=> setState(() {

                  }),
                  controller: _tabController,
                  isScrollable: false,
                  // Ensures equal tab sizes
                  indicator: BoxDecoration(
                    color: Colors.blue.shade50, // Background for selected tab
                    borderRadius: _tabController.index == 0
                        ? const BorderRadius.only(topLeft: Radius.circular(18))
                        : _tabController.index == 3 ? const BorderRadius.only(topRight: Radius.circular(8)) : const BorderRadius.only(topRight: Radius.circular(0)),
                  ),
              labelColor: Colors.blue,
                  // Text and icon color for selected tab
                  indicatorSize: TabBarIndicatorSize.tab,
                  // Indicator fills the tab width
                  unselectedLabelColor: Colors.black,
                  // Text and icon color for unselected tab
                  tabs: [
                    _buildTabItem("Cars", Icons.directions_car, "4500-5555"),
                    _buildTabItem("Buses", Icons.directions_bus, "4500-5555"),
                    _buildTabItem("Launches", Icons.directions_boat, "4500-5555"),
                    _buildTabItem("Flights", Icons.flight, "4500-5555"),
                  ],
                ),
              ),
              // TabBarView for content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(child: Text("Cars Content")),
                    Center(child: Text("Buses Content")),
                    Center(child: Text("Launches Content")),
                    Center(child: Text("Flights Content")),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // Method to build individual tab item
  Widget _buildTabItem(String label, IconData icon, String price) {
    return Tab(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            price,
            style: const TextStyle(fontSize: 8, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // Widget _buildTab(String label, IconData icon) {
  //   return Tab(
  //     height: 100,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(icon, size: 24),
  //         const SizedBox(height: 5),
  //         Text(
  //           label,
  //           style: const TextStyle(fontSize: 14),
  //         ),
  //         const Text(
  //           "4500-50000",
  //           style: TextStyle(fontSize: 8),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// Custom MultiIndicator
class MultiIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MultiIndicatorPainter();
  }
}

class _MultiIndicatorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paintBackground = Paint()
      ..color = Colors.blue.shade50
      ..style = PaintingStyle.fill;

    final paintLine = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    // Draw rounded background
    final Rect rect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      configuration.size!.width,
      configuration.size!.height,
    );

    final RRect roundedRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(12),
    );

    canvas.drawRRect(roundedRect, paintBackground);

    // Draw bottom line
    final double lineStartX = offset.dx;
    final double lineEndX = offset.dx + configuration.size!.width;

    canvas.drawLine(
      Offset(lineStartX, offset.dy + configuration.size!.height),
      Offset(lineEndX, offset.dy + configuration.size!.height),
      paintLine,
    );
  }
}
