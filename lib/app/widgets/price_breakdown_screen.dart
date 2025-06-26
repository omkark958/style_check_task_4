import 'package:flutter/material.dart';
import 'package:style_check_task_4/app/model/price_breakdown.dart';

class PricingBreakdownCard extends StatelessWidget {
  final PricingBreakdown data;

  const PricingBreakdownCard({super.key, required this.data});

  Widget _buildRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[400])),
          Text(value, style: TextStyle(color: valueColor ?? Colors.white)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1C1C1E),
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pricing Breakdown",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildRow("Subtotal(Tax Inclusive)",
                "₹${data.subtotal.toStringAsFixed(2)}"),
            _buildRow("CGST(2.5%)", "₹${data.cgst.toStringAsFixed(2)}"),
            _buildRow("SGST(2.5%)", "₹${data.sgst.toStringAsFixed(2)}"),
            _buildRow(
                "Discount(20.00%)", "-₹${data.discount.toStringAsFixed(2)}",
                valueColor: Colors.red),
            _buildRow(
                "Shipping Charges", "₹${data.shipping.toStringAsFixed(2)}"),
            _buildRow("Adjustment", "₹${data.adjustment.toStringAsFixed(2)}"),
            _buildRow("Rounding", "₹${data.rounding.toStringAsFixed(2)}"),
            const Divider(color: Colors.grey, height: 24),
            _buildRow("Total Amount", "₹${data.total.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
