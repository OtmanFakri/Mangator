import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:mangator/models/Chapiters.dart';

class Chapiters_Service {
  List<Chapiters> manga = [];

  Future<List<Chapiters>> GetChapiter(String ID) async {
    var res = await http.get(Uri.parse('https://api.consumet.org/manga/mangahere/read?chapterId=$ID'));
    try {
      var data = jsonDecode(res.body);
      if(res.statusCode == 200){
        manga.clear();
        for(var i in data){
          manga.add(Chapiters.fromJson(i));
        }
        return manga;
      }else{
        var res = await http.get(Uri.parse('https://api.consumet.org/manga/mangakakalot/read?chapterId=$ID'));
        var data = jsonDecode(res.body);
        manga.clear();
        for(var i in data){
          manga.add(Chapiters.fromJson(i));
        }
        return manga;
      }

    }
    catch(e) {
      print(e);
      return manga;
    }

  }
}
