import 'package:get/get.dart';
import 'package:style_check_task_4/app/controllers/horizontal_drag_tab.controller.dart';

class HorizontaldragBind extends Bindings {
  @override
  void dependencies() {
    Get.put(HorizontalDragTabController());
  }
}
