import 'package:get/get.dart';
import 'package:mangator/models/Manga.dart';
import 'package:mangator/service/MangaService.dart';

import '../models/Manga.dart';
import '../service/Shearch_Service.dart';


class Sherch extends GetxController with StateMixin{


  final SearchService Serive=SearchService();
  RxList<dynamic> manga=[].obs;

  @override
  void onInit() {
  }



  Todo(int page,String SS) {
    Serive.GetManga(page, SS).then((value) {
      manga.addAll(value);
    });
  }
}


