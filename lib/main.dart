import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:style_check_task_4/app/routes/app_pages.dart';
import 'package:style_check_task_4/app/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.loading,
    getPages: AppPages.pages,
  ));
}
