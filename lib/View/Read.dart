import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:mangator/View/test.dart';

import '../Componante/ADs/ShowAd.dart';
import '../Controllor/Chapiters_Controlloer.dart';
import 'package:photo_view/photo_view.dart';

class Read extends GetView<Chapiters_controller> {
  List<dynamic> ChapiterID;

  Read({required this.ChapiterID});

  var ii;

  @override
  Widget build(BuildContext context) {
    ii = context;
    Get.lazyPut<Chapiters_controller>(() => Chapiters_controller());

    controller.Todo(ChapiterID[controller.indexChapiter.value].id);
    return controller.obx(
        (state) => Scaffold(
              body: chapiters(controller.mangachap),
            ),
        onEmpty: Center(child: Text("Empty Data .. :/")),
        onError: (error) => Center(child: Text(error!)),
        onLoading: Center(
          child: CircularProgressIndicator(),
        ));
  }

  chapiters(RxList mangachap) {
    return Stack(
      children: [
        DraggableBottomSheet(
          barrierDismissible: true,
          minExtent: 50,
          useSafeArea: false,
          curve: Curves.linear,
          previewWidget: continer(),
          expandedWidget: _previewWidget(mangachap),
          backgroundWidget: _expandedWidget(),
          duration: const Duration(milliseconds: 10),
          maxExtent: Get.height * 0.6,
          onDragging: (pos) {
          },
        ),
      ],
    );
  }

  _previewWidget(RxList mangachap) {
    return Container(
      width: double.infinity,
      height: Get.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black54,
      ),
      child: ListView.builder(
          itemCount: ChapiterID.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.indexChapiter.value = index;
                controller.mangachap.clear();
                controller.Todo(ChapiterID[controller.indexChapiter.value].id);
                controller.showAD();
                (ii as Element).markNeedsBuild();

              },
              child: chapiter(ChapiterID[index].title),
            );
          }),
    );
  }

  _expandedWidget() {
    return PageView(
        scrollDirection: Axis.vertical,
        children: controller.mangachap.map((element) {
          return Container(
            child: PhotoView(
              imageProvider:
                  getNetworkImage(element.img, element.headerForImage.referer),
            ),
          );
        }).toList());
  }

  chapiter(title) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(title,maxLines: 1),
    );
  }

  continer() {
    return Column(
      children: [
        Icon(Icons.keyboard_arrow_up_sharp,color: Colors.white),
        Padding(padding: EdgeInsets.only(left: 10,top: 2,right: 10),
        child:  Text(ChapiterID[controller.indexChapiter.value].title,maxLines: 1,))
      ],
    );
  }
}
