import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../models/Manga.dart';

class SearchService {
  List<Manga> manga = [];

  Future<List<Manga>> GetManga(int Page,[String sher=""]) async {
    var res = await http.get(Uri.parse('https://api.consumet.org/manga/mangahere/$sher?page=${Page.toString()}'));
    var res2 = await http.get(Uri.parse('https://api.consumet.org/manga/mangakakalot/$sher'));
    var data = jsonDecode(res.body);
    var data2 = jsonDecode(res2.body);
    manga.clear();
    if((res.statusCode == 200) || (res.statusCode == 200)){
      for (var ii in data["results"]) {
        manga.add(Manga.fromJson(ii));
      }
      for (var ii2 in data2["results"]) {
        manga.add(Manga.fromJson(ii2));
      }
      return manga;
    }else{
      return manga;
    }
    }

}
