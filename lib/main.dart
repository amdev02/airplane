import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:varana_apps/pages/sign_in_for_betty.dart';
import 'package:varana_apps/pages/sign_in_page.dart';
import 'package:varana_apps/pages/splash_page.dart';
import 'package:varana_apps/pages/users/markom_page.dart';
import 'package:varana_apps/pages/users/sales_page.dart';
import 'package:varana_apps/pages/users/spv_page.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("e9f27ed9-9f32-401e-9a89-374ef43fcec7");

  // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Varana Cluster',      
      theme: ThemeData(),
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sales-page': (context) => SalesPage(),
        '/markom-page': (context) => MarkomPage(),
        '/spv-page': (context) => SpvPage(),
        '/sign-in-betty': (context) => SignInForBetty(),
      },
    );
  }
}
