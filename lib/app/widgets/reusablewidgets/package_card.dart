import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:style_check_task_4/app/model/package_card_model.dart';

class PackageCard extends StatelessWidget {
  final PackageCardModel data;

  const PackageCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMMM yyyy');
    final timeFormat = DateFormat('hh:mm a');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.packageNo,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text("Total Quantity: ${data.totalQuantity}",
                  style: const TextStyle(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 8),

          /// Date & Time
          Row(
            children: [
              const Icon(Icons.circle, size: 5, color: Colors.grey),
              const SizedBox(width: 6),
              Text(dateFormat.format(data.createdDateTime),
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(width: 12),
              Text(timeFormat.format(data.createdDateTime),
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),

          const SizedBox(height: 12),

          /// Shipment Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(60, 232, 179, 110),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(data.status,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 158, 2), fontSize: 12)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Shipment Date: ${dateFormat.format(data.shipmentDate)}",
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(data.courierName,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 13)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
