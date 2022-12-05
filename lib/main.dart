import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangator/depandece.dart';
import 'package:mangator/url.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  ERROR();

  runApp(const Mangator());
}

class Mangator extends StatelessWidget {
  const Mangator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1d1f2b),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              fontSizeDelta: 5,
            ),
      ),
      //initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      getPages: Url.urlpage,
      initialRoute: "/test",
    );
  }
}


ERROR() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/error.jpg"),fit: BoxFit.cover
          )
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('BACK'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          ),
        ),
      ),
    );
  };
}