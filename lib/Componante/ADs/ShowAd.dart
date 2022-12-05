import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'HelpAd.dart';

class ShowAd {
  static late InterstitialAd _interstitialAd;
  static bool isAd = false;

  static void Load() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-4344285073856246/7114953205",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print("Loading ...");
            _interstitialAd = ad;
            isAd=true;
            showAD();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  static void showAD(){
    if(isAd){
      print("showing ..");
      _interstitialAd.show();
    }
    print("showing2 ..");
    _interstitialAd.show();
  }

}