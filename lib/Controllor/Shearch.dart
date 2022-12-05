import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/ShearchViw.dart';
import 'Sherch_controller.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String>{
  var uu=Get.put(Sherch(),);
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions

  }



  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
      return IconButton(onPressed: (){
        uu.manga.clear();
        Get.back();
      }, icon: Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    return Search(query);
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return Center(child: Text("M A N G A T O R"),);
  }
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: Colors.transparent
      )
    );}
}