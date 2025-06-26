class ProductCardData {
  final String title;
  final String hsn;
  final String sku;
  final double price;
  final int quantity;
  final String unit;
  final String imageUrl;
  final int picked, packed, shipped, invoiced;

  ProductCardData({
    required this.title,
    required this.hsn,
    required this.sku,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.imageUrl,
    required this.picked,
    required this.packed,
    required this.shipped,
    required this.invoiced,
  });
}
