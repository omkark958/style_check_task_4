class PricingBreakdown {
  final double subtotal;
  final double cgst;
  final double sgst;
  final double discount;
  final double shipping;
  final double adjustment;
  final double rounding;
  final double total;

  PricingBreakdown({
    required this.subtotal,
    required this.cgst,
    required this.sgst,
    required this.discount,
    required this.shipping,
    required this.adjustment,
    required this.rounding,
    required this.total,
  });
}
