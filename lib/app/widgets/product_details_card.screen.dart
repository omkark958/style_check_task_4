import 'package:flutter/material.dart';
import 'package:style_check_task_4/app/model/product_details.dart';

class ProductCard extends StatelessWidget {
  final ProductCardData data;

  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1C1C1E),
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼 Image + Title + HSN + SKU
            // Top layout: image + details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    data.imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.broken_image,
                        size: 70,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "HSN/SAC: ${data.hsn}",
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "SKU: ${data.sku}",
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

// Align More button to the right
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: SizedBox(
            //     height: 32,
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.grey[850],
            //         foregroundColor: Colors.white,
            //         padding: const EdgeInsets.symmetric(horizontal: 12),
            //         minimumSize: Size.zero,
            //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //       ),
            //       child: const Text("More", style: TextStyle(fontSize: 12)),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 12),

            // 💵 Price + Quantity + More button
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("Selling Price",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("₹${data.price.toStringAsFixed(2)}",
                                  style: const TextStyle(color: Colors.white)),
                              const SizedBox(
                                width: 15,
                              ),
                              Text("per ${data.unit}",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ]),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("Quantity",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${data.quantity}",
                                style: const TextStyle(color: Colors.white)),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(data.unit,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                    // height: 48,
                    // width: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Text("More",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ],
                    )),
              ],
            ),

            const SizedBox(height: 8),

            // 🧾 Status Line
            Text(
              "Picked: ${data.picked} ${data.unit} | Packed: ${data.packed} ${data.unit} | ",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              "Shipped: ${data.shipped} ${data.unit} | Invoiced: ${data.invoiced} ${data.unit}",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
