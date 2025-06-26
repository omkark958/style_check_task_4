class PackageCardModel {
  final String packageNo;
  final int totalQuantity;
  final DateTime createdDateTime;
  final DateTime shipmentDate;
  final String status;
  final String courierName;

  PackageCardModel({
    required this.packageNo,
    required this.totalQuantity,
    required this.createdDateTime,
    required this.shipmentDate,
    required this.status,
    required this.courierName,
  });
}
