import 'package:boxoniq/auth/login.dart';
import 'package:boxoniq/auth/otpverification.dart';
import 'package:boxoniq/auth/signup.dart';
import 'package:boxoniq/screens/StartScreen.dart';
import 'package:boxoniq/screens/billing.dart';
import 'package:boxoniq/screens/bundlecreatorPage.dart';
import 'package:boxoniq/screens/homescreen.dart';
import 'package:boxoniq/screens/mybundalSubscription.dart';
import 'package:boxoniq/screens/previewBundal.dart';
import 'package:boxoniq/screens/subscription.dart';
import 'package:boxoniq/splash/onbording.dart';
import 'package:boxoniq/splash/splashsceen.dart';
import 'package:boxoniq/util/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/splashsceen",
        routes: {
          "/splashsceen": (context) => Splash(),
          "/onbording": (context) => OnboardingScreen(),
          "/login": (context) => Login(),
          "/otpverification": (context) => VeryfiedOtp(),
          "/signup": (context) => Creatuser(),

          "/homescreen": (context) => HomeScrren(),
          "/StartScreen": (context) => Nav(),
          "/bundlecreatorPage": (context) => BundleCreatorPage(),
          "/previewBundal": (context) => PreviewBundalPage(),
          "/billing": (context) => BillingPage(),
          // "/cattgory": (context) => CattgoryPage(),
          "/mybundalSubscription": (context) => MyBundalSubscription(),
        });
  }
}
