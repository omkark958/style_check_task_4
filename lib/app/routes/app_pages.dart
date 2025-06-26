import 'package:get/get.dart';
import 'package:style_check_task_4/app/binding/horizontaldrag_bind.dart';
import 'package:style_check_task_4/app/screens/home_screen.screen.dart';
import 'package:style_check_task_4/app/screens/sales_order_details.screen.dart';
import '../views/loading_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loading, page: () => const LoadingView()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(
        name: AppRoutes.orderdetails,
        page: () => SalesOrderDetailsScreen(),
        binding: HorizontaldragBind()),
  ];
}
