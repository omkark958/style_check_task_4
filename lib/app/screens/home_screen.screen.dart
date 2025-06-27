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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  "Co-Retailing",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.notifications),
              icon: const Icon(
                Icons.notifications_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: const [
              Wrap(
                spacing: 16, // horizontal spacing
                runSpacing: 16, // vertical spacing
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
