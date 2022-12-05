import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../models/Manga.dart';

class mangaService {
  List<Manga> manga = [];

  Future<List<Manga>> GetManga(int Page,[String sher=""]) async {
    var res = await http.get(Uri.parse('https://api.consumet.org/manga/mangahere/$sher?page=${Page.toString()}'));
    var data = jsonDecode(res.body);
    for (var ii in data["results"]) {
      manga.add(Manga.fromJson(ii));
    }
    return manga;
  }
}
