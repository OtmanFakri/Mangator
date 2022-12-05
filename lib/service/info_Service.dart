import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import '../models/Info.dart';

class infoService {
  List<Info> manga = [];

  Future<List<Info>> GetInfo(String ID) async {
    var res = await http.get(Uri.parse('https://api.consumet.org/manga/mangakakalot/info?id=$ID'));
    try{
      if(res.statusCode ==200){
        var data = jsonDecode(res.body);
        manga.add(Info.fromJson(data));
        if(data["title"] == ""){
          manga.clear();
          var res = await http.get(Uri.parse('https://api.consumet.org/manga/mangahere/info?id=$ID'));
          var data = jsonDecode(res.body);
          manga.add(Info.fromJson(data));
        }
      }else{
        print("error .. .. . ");
      }
    }catch(e) {
      print(e);
    }

    return manga;
  }
}
