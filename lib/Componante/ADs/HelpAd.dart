import 'package:google_mobile_ads/google_mobile_ads.dart';

class HelpAd {
  static bool _testMode = false;

  static String get Ad1 {
    if (_testMode) {
      String ss = "ca-app-pub-3940256099942544/1033173712";
      return ss;
    }
    return "ca-app-pub-3940256099942544/1033173712";
  }
}

