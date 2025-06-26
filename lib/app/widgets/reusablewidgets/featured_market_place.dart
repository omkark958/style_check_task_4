import 'package:flutter/material.dart';

class BrowseMarketplaceCard extends StatelessWidget {
  const BrowseMarketplaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 240,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome, size: 14, color: Colors.orange),
                    SizedBox(width: 6),
                    Text('Featured',
                        style: TextStyle(color: Colors.orange, fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text('Browse Marketplace',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              const Text(
                'Discover premium partners and products from 500+ verified partners and manage the relationship with 28 active partners',
                style: TextStyle(
                    color: Color(0xFFB0B3C4), fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.chat_bubble_outline,
                                size: 18, color: Colors.orange),
                            SizedBox(width: 8),
                            Text('Real-time chat',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.verified_user_outlined,
                                size: 18, color: Colors.orange),
                            SizedBox(width: 8),
                            Text('Verified Sellers',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(120, 42),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Manage Partners',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12)),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward,
                            size: 16, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey[850], shape: BoxShape.circle),
                  child: const Icon(Icons.show_chart,
                      color: Colors.white, size: 20),
                ),
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1.5)),
                    child: const Center(
                      child: Text('6',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
