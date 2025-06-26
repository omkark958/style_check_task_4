import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_check_task_4/app/routes/app_routes.dart';

class BorrowedItemCard extends StatelessWidget {
  final String logoUrl;
  final String companyName;
  final String userName;
  final String status;
  final String borrowId;
  final String dateTime;
  final int noOfItems;
  final String payableAmount;
  final String returnWindow;
  final String dueDate;

  const BorrowedItemCard({
    super.key,
    required this.logoUrl,
    required this.companyName,
    required this.userName,
    required this.status,
    required this.borrowId,
    required this.dateTime,
    required this.noOfItems,
    required this.payableAmount,
    required this.returnWindow,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          /// Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(logoUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(companyName,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 4),
                    Text("by $userName",
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white70)),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status,
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.call, color: Colors.white60, size: 20),
            ],
          ),
          const SizedBox(height: 20),

          /// Two-Column Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Left Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleValue("Borrow ID", borrowId),
                    const SizedBox(height: 16),
                    _iconValue(Icons.inventory_2, "No. of Items", "$noOfItems"),
                    const SizedBox(height: 16),
                    _iconValue(
                        Icons.currency_rupee, "Payable Amount", payableAmount,
                        color: Colors.redAccent),
                  ],
                ),
              ),

              /// Right Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _titleValue("Date & Time", dateTime, alignRight: true),
                    const SizedBox(height: 16),
                    _iconValue(
                        Icons.sync_alt, "Exchange/Return Window", returnWindow,
                        alignRight: true),
                    const SizedBox(height: 16),
                    _iconValue(Icons.calendar_today, "Due Date", dueDate,
                        alignRight: true),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Colors.white24),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text("View Details"),
                  onPressed: () {
                    Get.toNamed(AppRoutes.orderdetails);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.message_outlined),
                  label: const Text("Message"),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _titleValue(String title, String value, {bool alignRight = false}) {
    return Column(
      crossAxisAlignment:
          alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _iconValue(IconData icon, String title, String value,
      {Color color = Colors.orange, bool alignRight = false}) {
    return Row(
      mainAxisAlignment:
          alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment:
              alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.white60, fontSize: 12)),
            const SizedBox(height: 2),
            Row(children: [
              Icon(icon, size: 16, color: color),
              Text(value, style: TextStyle(color: color, fontSize: 14))
            ]),
          ],
        ),
      ],
    );
  }
}
