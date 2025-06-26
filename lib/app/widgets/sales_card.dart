import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  final dynamic data;

  const SalesCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color(0xFF1C1C1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade800),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Row: Logo, Title, Status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Logo
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(data["logoUrl"]),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(width: 12),

                /// Title and Subtext
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["companyName"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data["soNumber"],
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Text(
                        "Branch: ${data["branch"]}",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),

                /// Status Chip
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 56, 83, 57),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    data["status"].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Middle Row: Reference and Invoice
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reference#: ${data["referenceNo"]}",
                  style: const TextStyle(color: Colors.orange),
                ),
                Text(
                  data["invoiceNo"],
                  style: const TextStyle(color: Colors.orange),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Amount and Dates Row
            Row(
              children: [
                /// Amount Box
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 75,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹${data["totalAmount"].toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                /// Order & Expected Date Box
                Expanded(
                  child: Container(
                    height: 75,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.grey, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              "Order Date: ${data["orderDate"]}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.grey, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              "Expected By: ${data["expectedDate"]}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
