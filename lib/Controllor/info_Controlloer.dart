import 'package:get/get.dart';
import 'package:mangator/service/MangaService.dart';

import '../Componante/ADs/ShowAd.dart';
import '../models/Manga.dart';
import '../service/info_Service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:startapp_sdk/startapp.dart';

class info_controller extends GetxController with StateMixin {
  var mangainfo = [].obs;
  final infoService Serive = infoService();

  var startAppSdk = StartAppSdk();
  StartAppBannerAd? bannerAd;
  StartAppInterstitialAd? interstitialAd;

  @override
  void onInit() {
    print("on Int .....");
    //ShowAd.Load();
    baners();
  }

  baners() {
    startAppSdk.loadBannerAd(StartAppBannerType.BANNER).then((bannerAd) {
      this.bannerAd = bannerAd;
    }).onError<StartAppException>((ex, stackTrace) {
      print("Error loading Banner ad: ${ex.message}");
    }).onError((error, stackTrace) {
      print("Error loading Banner ad: $error");
    });
  }



  Todo(String ID) {
    Serive.GetInfo(ID).then((value) {
      mangainfo.addAll(value);
      change(mangainfo, status: RxStatus.success());
    });
  }
}
