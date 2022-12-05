import 'package:get/get.dart';
import 'package:mangator/Controllor/info_Controlloer.dart';
import 'package:mangator/Controllor/mangacontoller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<mangacontroller>(mangacontroller());
    Get.lazyPut<info_controller>(() => info_controller(), tag: 'Info'); // or optionally with tag

  }
}