import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_check_task_4/app/controllers/horizontal_drag_tab.controller.dart';

class HorizontallyDragTab extends GetView<HorizontalDragTabController> {
  final Function setPage;
  HorizontallyDragTab({super.key, required this.setPage});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(
          () => Row(
            children: [
              _buildTab("Details",
                  setPage: setPage, page: controller.page.value),
              const SizedBox(width: 8),
              _buildTab("Invoices",
                  setPage: setPage, page: controller.page.value),
              const SizedBox(width: 8),
              _buildTab("Picklists",
                  setPage: setPage, page: controller.page.value),
              const SizedBox(width: 8),
              _buildTab("Packages",
                  setPage: setPage, page: controller.page.value),
              const SizedBox(width: 8),
              _buildTab("History",
                  setPage: setPage, page: controller.page.value),
              // Add more tabs as needed
            ],
          ),
        ));
  }
}

Widget _buildTab(String label, {String? page, required Function setPage}) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: 16, vertical: 4), // reduced vertical padding
    decoration: BoxDecoration(
      color: page == label ? Colors.transparent : Colors.grey[900],
      borderRadius: BorderRadius.circular(30),
      border: page == label ? Border.all(color: Colors.white) : null,
    ),
    child: TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero, // remove default minimum
        padding: EdgeInsets.zero, // remove internal padding
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        setPage(label);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 4), // reduced inner padding
        child: Text(
          label,
          style: TextStyle(
            color: page == label ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 13, // optional: reduce font size for more compact look
          ),
        ),
      ),
    ),
  );
}
