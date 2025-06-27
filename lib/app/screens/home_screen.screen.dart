import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_check_task_4/app/routes/app_routes.dart';
import 'package:style_check_task_4/app/widgets/borrowed_item_screen.dart';
import 'package:style_check_task_4/app/widgets/reusablewidgets/active_deals.dart';
import 'package:style_check_task_4/app/widgets/reusablewidgets/bottom_right_curve_card.dart';
import 'package:style_check_task_4/app/widgets/reusablewidgets/featured_market_place.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        title:
            const Text("Co-Retailing", style: TextStyle(color: Colors.white)),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notifications),
            icon: const Icon(Icons.notifications_sharp, color: Colors.white),
          ),
        ],
      ),
      drawer: const AppDrawer(), // ← Step 2
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: const [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  BottomRightCurveCard(),
                  BottomRightCurveCard(),
                ],
              ),
              SizedBox(height: 24),
              ActiveDealsCard(
                title: 'Active Deals',
                activeCount: 12,
                pendingText: '3 pending approval',
              ),
              SizedBox(height: 24),
              BrowseMarketplaceCard(),
              SizedBox(height: 24),
              BorrowedItemsScreen(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1C1C1E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Welcome, Omkar!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.store, color: Colors.white),
            title: const Text('Sales Details',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.orderdetails);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Notification',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.notifications);
            },
          ),
        ],
      ),
    );
  }
}
