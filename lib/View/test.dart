import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangator/Controllor/info_Controlloer.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../Componante/ADs/ShowAd.dart';
import '../Controllor/Shearch.dart';
import '../Controllor/mangacontoller.dart';
import '../depandece.dart';
import '../models/Manga.dart';
import 'Details.dart';

class test extends GetView<mangacontroller> {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Hometest controller =Get.put(Hometest());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("M A N G A T O R"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(),
                );
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: controller.obx(
        (state) => listgrid(controller.manga),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: Text("enbty"),
        onError: (error) => Text(error!),
      ),
    );
  }
}

listgrid(RxList manga) {
  return ResponsiveGridList(
    desiredItemWidth: 100,
    children: manga.map((i) {
      return Padding(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 0, top: 05),
        child: InkWell(
          onTap: () {
            Get.to(() => Detail(ID: i.id),
                transition: Transition.rightToLeft, binding: HomeBinding());
            //ShowAd.showAD;
          },
          child: Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  image: DecorationImage(
                      image: getNetworkImage(i.image, i.headerForImage.referer),
                      onError: (Object e, StackTrace? stackTrace) {
                        getNetworkImage("getNetworkImage(i.image, i.headerForImage.referer),", i.headerForImage.referer);
                      },
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Text(i.title, maxLines: 1, textAlign: TextAlign.start),
            ],
          ),
        ),
      );
    }).toList(),
  );
}

NetworkImage getNetworkImage(String url, String ref) {
  //String url="https://v12.mkklcdnv6tempv4.com/img/tab_12/00/00/52/aa951409/chapter_1_romance_dawn/$index-o.jpg";
  Map<String, String> header = Map();
  header["Referer"] = ref;
  return NetworkImage(url, headers: header);
}
