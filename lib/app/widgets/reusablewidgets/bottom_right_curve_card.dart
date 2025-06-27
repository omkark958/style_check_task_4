import 'package:flutter/material.dart';

class BottomRightCurveCard extends StatelessWidget {
  const BottomRightCurveCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (MediaQuery.of(context).size.width - 45) / 2;

    return Stack(
      children: [
        // Simulated border layer
        ClipPath(
          clipper: BubbleNotchClipper(),
          child: Container(
            width: cardWidth,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey.shade800, // Border color
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

        // Foreground clipped card
        ClipPath(
          clipper: BubbleNotchClipper(),
          child: Container(
            width: cardWidth,
            height: 90,
            margin: const EdgeInsets.all(1), // Slight margin to show border
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "TOTAL EARNINGS",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 8,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "₹ 2,28,760",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "+12% from last month",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.show_chart,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BubbleNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double cornerRadius = 20;
    const double notchRadius = 25;

    Path path = Path();

    path.moveTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    path.lineTo(size.width, size.height - notchRadius * 2);
    path.quadraticBezierTo(
      size.width,
      size.height - notchRadius,
      size.width - notchRadius,
      size.height - notchRadius,
    );
    path.quadraticBezierTo(
      size.width - notchRadius * 2,
      size.height - notchRadius,
      size.width - notchRadius * 2,
      size.height,
    );

    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
