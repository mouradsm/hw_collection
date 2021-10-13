import 'package:get/get.dart';
import 'package:hw_colletion/pages/colletion/colletion_controller.dart';
import 'package:hw_colletion/pages/dashboard/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<CollectionController>(() => CollectionController());
  }

}