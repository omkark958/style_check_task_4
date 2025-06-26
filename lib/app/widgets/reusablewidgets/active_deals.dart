import 'package:flutter/material.dart';

class ActiveDealsCard extends StatelessWidget {
  final String title;
  final int activeCount;
  final String pendingText;

  const ActiveDealsCard({
    super.key,
    required this.title,
    required this.activeCount,
    required this.pendingText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 10,
                  letterSpacing: 1.2,
                  color: Colors.grey,
                ),
              ),
              const Icon(Icons.group_outlined, color: Colors.white60, size: 18),
            ],
          ),
          const SizedBox(height: 12),

          /// Active count
          Text(
            '$activeCount',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),

          /// Pending text
          Text(
            pendingText,
            style: const TextStyle(
              color: Color(0xFF6BA5C9), // light bluish tone
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
