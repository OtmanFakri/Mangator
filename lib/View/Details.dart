import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangator/Controllor/info_Controlloer.dart';
import 'package:mangator/View/Read.dart';
import 'package:mangator/View/test.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:startapp_sdk/startapp.dart';

import '../Controllor/mangacontoller.dart';

import 'package:bumble_scrollbar/bumble_scrollbar.dart';

import 'package:blurrycontainer/blurrycontainer.dart';

class Detail extends GetView<info_controller> {
  String ID;

  Detail({required this.ID});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<info_controller>(() => info_controller());
    controller.Todo(ID);
    return controller.obx((state) => Scaffold(body: BodyInfo()),
        onEmpty: Center(child: Text("Empty Data .. :/")),
        onError: (error) => Center(child: Text(error!)),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ));
  }

  BodyInfo() {
    return Stack(
      children: [
        Transform.translate(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  direction: Axis.horizontal,
                  children: [
                    tt("Rating", controller.mangainfo[0].rating.toString()),
                    tt("Last Chapetre",
                        controller.mangainfo[0].chapters[0].title),
                    tt("Languge", "En"),
                  ],
                ),
              ),
            ),
            offset: Offset(0, 25)),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent.withOpacity(0.0),
              Colors.black.withOpacity(1)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.all(Get.width * 0.3),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                        image: DecorationImage(
                            image: getNetworkImage(
                                controller.mangainfo[0].image,
                                controller.mangainfo[0].headers.referer),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  title: Text(controller.mangainfo[0].title),
                  centerTitle: true,
                ),
                backgroundColor: Colors.transparent,
                expandedHeight: Get.height * 0.6,
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                   child:  Container(
                     child: controller.bannerAd != null ? StartAppBanner(controller.bannerAd!) :SizedBox(),
                   ),),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("By : " + controller.mangainfo[0].authors[0] ,
                          textAlign: TextAlign.start),
                    ),
                    //Description
                    Container(
                      width: double.infinity,
                      height: Get.height * 0.2,
                      child: BumbleScrollbar(
                        alignment: Alignment.topLeft,
                        thumbColor: Colors.white70,
                        backgroundColor: Colors.white24,
                        strokeHeight: Get.height * 0.18,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Des(controller.mangainfo[0].description),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => Read(
                                ChapiterID: controller.mangainfo[0].chapters,
                              ));
                        },
                        child: Text('Start Reading'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, Get.height * 0.07),
                          backgroundColor: Colors.deepOrange.shade400,
                          shadowColor: Colors.white,
                          elevation: 88,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Des(String S) {
    return Text(
      S,
      style: TextStyle(
        color: Colors.white60,
        fontSize: 19,
      ),
    );
  }
}

tt(String name, String name2) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(text: '$name : '),
      TextSpan(
          text: '${name2} ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )),
    ]),
  );
}
