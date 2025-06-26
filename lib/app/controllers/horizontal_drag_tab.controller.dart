import 'package:get/get.dart';
import 'package:style_check_task_4/app/model/package_card_model.dart';
import 'package:style_check_task_4/app/model/sales_order_history_model.dart';

class HorizontalDragTabController extends GetxController {
  RxString page = "Details".obs;
  final RxString packageSearchQuery = ''.obs;
  final RxString packageFilterStatus = ''.obs;
  final RxString packageSortBy = ''.obs; // e.g. "quantity", "date"

  List<SalesOrderActivity> activityList = [
    SalesOrderActivity(
      initials: "SS",
      name: "Sawan Singh",
      dateTime: DateTime(2025, 1, 31, 20, 27),
      amount: 6500.00,
      description: "Sales order created for",
    ),
    SalesOrderActivity(
      initials: "AK",
      name: "Anil Kumar",
      dateTime: DateTime(2025, 2, 5, 14, 10),
      amount: 4500.00,
      description: "Sales order created for",
    ),
    SalesOrderActivity(
      initials: "RH",
      name: "Ritika Handa",
      dateTime: DateTime(2025, 2, 10, 9, 45),
      amount: 8800.00,
      description: "Sales order approved for",
    ),
    SalesOrderActivity(
      initials: "VP",
      name: "Vikas Patil",
      dateTime: DateTime(2025, 2, 12, 18, 30),
      amount: 3120.00,
      description: "Sales order shipped for",
    ),
    SalesOrderActivity(
      initials: "PK",
      name: "Pooja Khanna",
      dateTime: DateTime(2025, 2, 15, 11, 5),
      amount: 7200.00,
      description: "Invoice generated for",
    ),
    SalesOrderActivity(
      initials: "RB",
      name: "Rahul Bansal",
      dateTime: DateTime(2025, 2, 20, 16, 22),
      amount: 9800.00,
      description: "Sales order created for",
    ),
    SalesOrderActivity(
      initials: "NS",
      name: "Neha Sharma",
      dateTime: DateTime(2025, 3, 1, 13, 40),
      amount: 5320.00,
      description: "Order closed with amount",
    ),
    SalesOrderActivity(
      initials: "YT",
      name: "Yash Thakur",
      dateTime: DateTime(2025, 3, 3, 10, 10),
      amount: 7650.00,
      description: "Follow-up scheduled for",
    ),
    SalesOrderActivity(
      initials: "MB",
      name: "Megha Bhatt",
      dateTime: DateTime(2025, 3, 6, 19, 50),
      amount: 8800.00,
      description: "Order returned of value",
    ),
    SalesOrderActivity(
      initials: "HK",
      name: "Harsh Kapoor",
      dateTime: DateTime(2025, 3, 8, 8, 5),
      amount: 3340.00,
      description: "Sales order created for",
    ),
    SalesOrderActivity(
      initials: "SS",
      name: "Sawan Singh",
      dateTime: DateTime(2025, 1, 31, 20, 27),
      amount: 6500.00,
      description: "Sales order created for",
    ),
    SalesOrderActivity(
      initials: "AK",
      name: "Anil Kumar",
      dateTime: DateTime(2025, 2, 5, 14, 10),
      amount: 4500.00,
      description: "Sales order created for",
    ),
  ];
  final List<PackageCardModel> packages = [
    PackageCardModel(
      packageNo: "PKG-000001",
      totalQuantity: 20,
      createdDateTime: DateTime(2025, 6, 1, 10, 30),
      shipmentDate: DateTime(2025, 6, 3),
      status: "Delivered",
      courierName: "Blue Dart",
    ),
    PackageCardModel(
      packageNo: "PKG-000002",
      totalQuantity: 15,
      createdDateTime: DateTime(2025, 6, 2, 12, 15),
      shipmentDate: DateTime(2025, 6, 5),
      status: "Pending",
      courierName: "Delhivery",
    ),
    PackageCardModel(
      packageNo: "PKG-000003",
      totalQuantity: 30,
      createdDateTime: DateTime(2025, 6, 3, 9, 45),
      shipmentDate: DateTime(2025, 6, 6),
      status: "In Transit",
      courierName: "FedEx",
    ),
    PackageCardModel(
      packageNo: "PKG-000004",
      totalQuantity: 12,
      createdDateTime: DateTime(2025, 6, 4, 11, 20),
      shipmentDate: DateTime(2025, 6, 7),
      status: "Delivered",
      courierName: "Shadowfax",
    ),
    PackageCardModel(
      packageNo: "PKG-000005",
      totalQuantity: 25,
      createdDateTime: DateTime(2025, 6, 5, 14, 5),
      shipmentDate: DateTime(2025, 6, 8),
      status: "Pending",
      courierName: "XpressBees",
    ),
    PackageCardModel(
      packageNo: "PKG-000006",
      totalQuantity: 18,
      createdDateTime: DateTime(2025, 6, 6, 16, 40),
      shipmentDate: DateTime(2025, 6, 9),
      status: "In Transit",
      courierName: "Ecom Express",
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  setPage(String page) {
    this.page.value = page;
  }

  List<PackageCardModel> get filteredPackages {
    // Step 1: Apply filter
    List<PackageCardModel> filtered = packages.where((pkg) {
      final matchesSearch = pkg.packageNo
          .toLowerCase()
          .contains(packageSearchQuery.value.toLowerCase());
      final matchesStatus = packageFilterStatus.value.isEmpty ||
          pkg.status == packageFilterStatus.value;
      return matchesSearch && matchesStatus;
    }).toList();

    // Step 2: Apply sorting
    if (packageSortBy.value == 'quantity') {
      filtered.sort((a, b) => b.totalQuantity.compareTo(a.totalQuantity));
    } else if (packageSortBy.value == 'date') {
      filtered.sort((a, b) => b.shipmentDate.compareTo(a.shipmentDate));
    }

    return filtered;
  }
}
