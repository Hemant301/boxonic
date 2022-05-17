import 'package:boxoniq/auth/login.dart';
import 'package:boxoniq/auth/loginotp.dart';
import 'package:boxoniq/auth/mobilelogin.dart';
import 'package:boxoniq/auth/otpverification.dart';
import 'package:boxoniq/auth/signup.dart';
import 'package:boxoniq/screens/StartScreen.dart';
import 'package:boxoniq/screens/Wallet.dart';
import 'package:boxoniq/screens/address.dart';
import 'package:boxoniq/screens/addressbook.dart';
import 'package:boxoniq/screens/addtobundle.dart';
import 'package:boxoniq/screens/billing.dart';
import 'package:boxoniq/screens/blog.dart';
import 'package:boxoniq/screens/blogdetail.dart';
import 'package:boxoniq/screens/bundlecreatorPage.dart';
import 'package:boxoniq/screens/checkwallet.dart';
import 'package:boxoniq/screens/contact.dart';
import 'package:boxoniq/screens/editprofile.dart';
import 'package:boxoniq/screens/homescreen.dart';
import 'package:boxoniq/screens/mybundalSubscription.dart';
import 'package:boxoniq/screens/myorderdetail.dart';
import 'package:boxoniq/screens/myorderpage.dart';
import 'package:boxoniq/screens/mysublist.dart';
import 'package:boxoniq/screens/pdf.dart';
import 'package:boxoniq/screens/previewBundal.dart';
import 'package:boxoniq/screens/productditels.dart';
import 'package:boxoniq/screens/profile.dart';
import 'package:boxoniq/screens/subscription.dart';
import 'package:boxoniq/screens/subsdetail.dart';
import 'package:boxoniq/screens/thankyou.dart';
import 'package:boxoniq/splash/onbording.dart';
import 'package:boxoniq/splash/splashsceen.dart';
import 'package:boxoniq/util/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/policies.dart';

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
          "/subscription": (context) => SubscriptionPage(),
          "/thankyou": (context) => Thankyou(),
          "/address": (context) => Address(),
          "/checkwallet": (context) => Checkwallet(),
          "/myorderdetail": (context) => Myorderdetail(),
          "/mysublist": (context) => Mysublist(),
          "/subsdetail": (context) => Subsdetail(),
          "/addtobundle": (context) => Addtobundle(),
          "/Wallet": (context) => WallatePage(),
          "/myorderpage": (context) => MyOrderPage(),
          "/mobilelogin": (context) => Mobilelogin(),
          "/loginotp": (context) => Loginotp(),
          "/profile": (context) => Profile(),
          "/addressbook": (context) => Addressbook(),
          "/policies": (context) => Policies(),
          "/pdf": (context) => PdfView(),
          "/contact": (context) => Contact(),
          "/blog": (context) => Blog(),
          "/blogdetail": (context) => Blogdetail(),
          "/editprofile": (context) => Editprofile(),
          "/productditels": (context) => ProductDitels()
        });
  }
}
