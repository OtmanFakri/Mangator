import 'package:get/get.dart';
import 'package:mangator/depandece.dart';

import 'View/test.dart';

class Url {
  static var urlpage = [
    GetPage(name: "/test", page: () => test(),binding: HomeBinding()),
  ];
}
