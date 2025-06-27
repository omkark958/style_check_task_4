import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Order #1234 shipped',
        'message': 'Your order has been shipped via Blue Dart.',
        'time': '2h ago',
        'icon': Icons.local_shipping
      },
      {
        'title': 'New message from Support',
        'message': 'Hi Omkar, your ticket has been updated.',
        'time': '4h ago',
        'icon': Icons.message
      },
      {
        'title': 'Payment Received',
        'message': 'We have received ₹8,500 for Invoice #INV2025.',
        'time': 'Yesterday',
        'icon': Icons.payment
      },
      {
        'title': 'Account Verified',
        'message': 'Your account has been successfully verified.',
        'time': '2 days ago',
        'icon': Icons.verified_user
      },
      {
        'title': 'Weekly Report Ready',
        'message': 'Your weekly performance report is available now.',
        'time': '3 days ago',
        'icon': Icons.assessment
      },
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFF1C1C1E),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return ListTile(
            leading: Icon(
              item['icon'] as IconData,
              color: Colors.white,
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              item['message'] as String,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Text(
              item['time'] as String,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
