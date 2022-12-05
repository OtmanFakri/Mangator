import 'package:get/get.dart';
import 'package:mangator/service/Chapiters_Service.dart';
import 'package:mangator/service/MangaService.dart';

import '../models/Manga.dart';
import '../service/info_Service.dart';

import 'package:startapp_sdk/startapp.dart';


class Chapiters_controller extends GetxController with StateMixin{

  var mangachap=[].obs;
  RxInt indexChapiter=0.obs;
  final Chapiters_Service Serive=Chapiters_Service();


  var startAppSdk = StartAppSdk();
  StartAppInterstitialAd? interstitialAd;


  @override
  void onInit() {

    loadInterstitialAd();
  }

  Todo(String ID){
    try {
      Serive.GetChapiter(ID).then((value)  {
        mangachap.addAll(value);
        change(mangachap, status: RxStatus.success());
      });
    }
    catch(e) {
      change(mangachap, status: RxStatus.error());
    }



  }

  void loadInterstitialAd() async {
    await startAppSdk.loadInterstitialAd().then((interstitialAd) {
      this.interstitialAd = interstitialAd;
    }).onError((ex, stackTrace) {
      print("Error loading Interstitial ad:ex :  ${ex}");
    }).onError((error, stackTrace) {
      print("Error loading Interstitial ad: $error");
    });
  }

  showAD() {
    if (interstitialAd != null) {
      interstitialAd!.show().then((shown) {
        if (shown) {
          print("show ...............................");
          this.interstitialAd = null;
          // NOTE load again
          loadInterstitialAd();
        }
        return null;
      }).onError((error, stackTrace) {
        print("Error showing Interstitial ad: $error");
      });
    }
  }
}


