import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mangator/Controllor/Sherch_controller.dart';
import 'package:mangator/View/test.dart';

import 'Details.dart';

class Search extends GetView<Sherch> {
  String qq;

  Search(this.qq);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<Sherch>(() => Sherch());

    controller.Todo(1, qq);
    var ii=controller.manga.value.reversed;
    return listgrid(ii.toList().obs);
  }

}

