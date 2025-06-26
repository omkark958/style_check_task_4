import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_check_task_4/app/controllers/horizontal_drag_tab.controller.dart';

class PackageFilterBar extends StatelessWidget {
  final controller = Get.find<HorizontalDragTabController>();
  static const IconData filter_alt_outlined =
      IconData(0xf068, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Filter Icon (Status)
        IconButton(
          icon: const Icon(
            filter_alt_outlined,
            color: Colors.white,
          ),
          tooltip: "Filter by Status",
          onPressed: () => _showStatusFilterBottomSheet(context),
        ),

        // Sort Icon
        IconButton(
          icon: const Icon(
            Icons.swap_vert,
            size: 25,
            color: Colors.white,
          ),
          tooltip: "Sort",
          onPressed: () => _showSortBottomSheet(context),
        ),
      ],
    );
  }

  void _showStatusFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const Text("Filter by Status", style: TextStyle(color: Colors.white)),
          const Divider(color: Colors.grey),
          for (var status in ["All", "Delivered", "Pending", "In Transit"])
            ListTile(
              title: Text(
                status,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                controller.packageFilterStatus.value =
                    status == "All" ? "" : status;
                controller.packageSortBy.refresh();
                Get.back();
              },
            )
        ],
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const Text("Sort Packages", style: TextStyle(color: Colors.white)),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text("Shipment Date",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              controller.packageSortBy.value = "date";
              controller.packageSortBy.refresh();
              Get.back();
            },
          ),
          ListTile(
            title: const Text("Total Quantity",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              controller.packageSortBy.value = "quantity";
              controller.packageSortBy.refresh();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
