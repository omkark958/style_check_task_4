import "dart:ffi";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:style_check_task_4/app/controllers/horizontal_drag_tab.controller.dart";
import "package:style_check_task_4/app/model/price_breakdown.dart";
import "package:style_check_task_4/app/model/product_details.dart";
import "package:style_check_task_4/app/widgets/horizontally_drag_tab.dart";
import "package:style_check_task_4/app/widgets/packages_filter_bar.dart";
import "package:style_check_task_4/app/widgets/price_breakdown_screen.dart";
import "package:style_check_task_4/app/widgets/product_details_card.screen.dart";
import "package:style_check_task_4/app/widgets/reusablewidgets/package_card.dart";
import "package:style_check_task_4/app/widgets/reusablewidgets/sales_order_history.dart";
import "package:style_check_task_4/app/widgets/sales_card.dart";

class SalesOrderDetailsScreen extends GetView<HorizontalDragTabController> {
  const SalesOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sales Order Details",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications_sharp,
                  color: Colors.white,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const SalesCard(
                  data: {
                    "companyName": "Global Enterprises",
                    "soNumber": "SO-00002234",
                    "branch": "Head Office",
                    "referenceNo": "QT-00002234",
                    "invoiceNo": "INV-00002234",
                    "totalAmount": 6500.00,
                    "orderDate": "04 Jun 2025",
                    "expectedDate": "12 Jun 2025",
                    "status": "Closed",
                    "logoUrl":
                        "https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/06/Starbucks_Corporation_Logo_2011.svg-e1657703028844.png?auto=format&q=60&fit=max&w=930",
                  },
                ),
                HorizontallyDragTab(
                  setPage: controller.setPage,
                ),
                if (controller.page.value == "Details") ...[
                  buildStatusAndInfoCards(),
                  Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(6),
                            border: const Border(
                              left: BorderSide(color: Colors.white, width: 8),
                            ),
                          ),
                          child: const Text(
                            "Product Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ProductCard(
                          data: ProductCardData(
                            title: "Single Dohar Pair - 5DB8",
                            hsn: "345676",
                            sku: "SINHOMCOT433434",
                            price: 1190,
                            quantity: 13,
                            unit: "Set",
                            imageUrl:
                                "https://cdnblog.picsart.com/2022/05/Square-Logos-That-Highlight-Structure-780x520.jpg",
                            picked: 12,
                            packed: 12,
                            shipped: 12,
                            invoiced: 12,
                          ),
                        ),
                        ProductCard(
                          data: ProductCardData(
                            title: "Single Dohar Pair - 5DB8",
                            hsn: "345677",
                            sku: "SINHOMCOT433435",
                            price: 1250,
                            quantity: 15,
                            unit: "Set",
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFpKrUX4DNzMekwIb1NW-l0gZVWBubveTREA&s",
                            picked: 5,
                            packed: 4,
                            shipped: 3,
                            invoiced: 5,
                          ),
                        ),
                        PricingBreakdownCard(
                          data: PricingBreakdown(
                            subtotal: 4190.00,
                            cgst: 28.33,
                            sgst: 28.33,
                            discount: 278.00,
                            shipping: 78.00,
                            adjustment: 40.00,
                            rounding: 0.33,
                            total: 5190.00,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade800),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Icon on the left
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.article,
                              color: Colors.white, size: 24),
                        ),
                        const SizedBox(width: 12),

                        /// Text content in center
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Template",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Template: Spreadsheet Template\nNotes: Thanks for your business",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Edit Button on the right
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade900,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Edit Template",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                if (controller.page.value == "History") ...[
                  Column(
                    children: controller.activityList
                        .map((e) => SalesOrderActivityCard(data: e))
                        .toList(),
                  )
                ],
                // if (controller.page.value == "Packages") ...[
                //   SizedBox(
                //     height: 400, // or MediaQuery.of(context).size.height * 0.5
                //     child: ListView.builder(
                //       itemCount: controller.packages.length,
                //       itemBuilder: (_, index) =>
                //           PackageCard(data: controller.packages[index]),
                //     ),
                //   )
                // ],
                if (controller.page.value == "Packages") ...[
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: PackageFilterBar(),
                  ),
                  const SizedBox(height: 12),
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.filteredPackages.length,
                        itemBuilder: (_, index) => PackageCard(
                            data: controller.filteredPackages[index]),
                      )),
                ],
                if (controller.page.value == "Invoices") ...[
                  SizedBox(
                      height:
                          400, // or MediaQuery.of(context).size.height * 0.5
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Coming Soon ${controller.page.value}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Icon(
                              Icons.book_online_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ))
                ],
                if (controller.page.value == "Picklists") ...[
                  SizedBox(
                      height:
                          400, // or MediaQuery.of(context).size.height * 0.5
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Coming Soon ${controller.page.value}",
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Icon(
                              Icons.list,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ))
                ]
              ],
            ),
          )),
    );
  }
}

Widget buildStatusAndInfoCards() {
  return Column(
    children: [
      /// Sales Order Status Card
      Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(6),
                border: const Border(
                  left: BorderSide(color: Colors.white, width: 8),
                ),
              ),
              child: const Text(
                "Sales Order Status",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatusColumn(title: "Order", value: "CLOSED"),
                _StatusColumn(title: "Invoice", value: "INVOICED"),
                _StatusColumn(title: "Payment", value: "UNPAID"),
                _StatusColumn(title: "Shipment", value: "SHIPPED"),
              ],
            ),
          ],
        ),
      ),

      /// More Information Card
      Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade800),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Collapsible Header with Arrow
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(6),
                border: const Border(
                  left: BorderSide(color: Colors.white, width: 8),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "More Information",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 12),

            /// Salesperson Detail
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Salesperson",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Text("Himanshu Sarode",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}

/// Small status column widget
class _StatusColumn extends StatelessWidget {
  final String title;
  final String value;

  const _StatusColumn({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
