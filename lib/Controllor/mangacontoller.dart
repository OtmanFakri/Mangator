import 'package:get/get.dart';
import 'package:mangator/models/Manga.dart';
import 'package:mangator/service/MangaService.dart';

import '../Componante/ADs/ShowAd.dart';
import '../models/Manga.dart';

import 'package:onesignal_flutter/onesignal_flutter.dart';


class mangacontroller extends GetxController with StateMixin{

  RxList<dynamic> manga=[].obs;
  final mangaService Serive=mangaService();

  bool isLoading=false;
  bool hasMore=true;
  @override
  void onInit() {
    manga.clear();
    Todo(1);
    Notification();
  }
  Todo(int page){
    Serive.GetManga(page).then((value)  {
      manga.addAll(value);
      change(manga, status: RxStatus.success());
    });


  }

  Notification(){
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("00f21764-0260-431f-8ebf-36dfdd6a3d24");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });
  }
}


