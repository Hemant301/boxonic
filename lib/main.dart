import 'dart:io';

import 'package:boxoniq/auth/login.dart';
import 'package:boxoniq/auth/loginotp.dart';
import 'package:boxoniq/auth/mobilelogin.dart';
import 'package:boxoniq/auth/newpass.dart';
import 'package:boxoniq/auth/otpverification.dart';
import 'package:boxoniq/auth/resetpassword.dart';
import 'package:boxoniq/auth/signup.dart';
import 'package:boxoniq/screens/StartScreen.dart';
import 'package:boxoniq/screens/Wallet.dart';
import 'package:boxoniq/screens/about.dart';
import 'package:boxoniq/screens/address.dart';
import 'package:boxoniq/screens/addressbook.dart';
import 'package:boxoniq/screens/addtobundle.dart';
import 'package:boxoniq/screens/billing.dart';
import 'package:boxoniq/screens/blog.dart';
import 'package:boxoniq/screens/blogdetail.dart';
import 'package:boxoniq/screens/bundlecreatorPage.dart';
import 'package:boxoniq/screens/changeaddress.dart';
import 'package:boxoniq/screens/checkwallet.dart';
import 'package:boxoniq/screens/community.dart';
import 'package:boxoniq/screens/communitydetail.dart';
import 'package:boxoniq/screens/communityquestions.dart';
import 'package:boxoniq/screens/communitysearch.dart';
import 'package:boxoniq/screens/contact.dart';
import 'package:boxoniq/screens/cummunityonboard.dart';
import 'package:boxoniq/screens/editaddress.dart';
import 'package:boxoniq/screens/editprofile.dart';
import 'package:boxoniq/screens/faq.dart';
import 'package:boxoniq/screens/homescreen.dart';
import 'package:boxoniq/screens/mybundalSubscription.dart';
import 'package:boxoniq/screens/myorderdetail.dart';
import 'package:boxoniq/screens/myorderpage.dart';
import 'package:boxoniq/screens/mysublist.dart';
import 'package:boxoniq/screens/mysubsdetail.dart';
import 'package:boxoniq/screens/newaddress.dart';
import 'package:boxoniq/screens/notify.dart';
import 'package:boxoniq/screens/pdf.dart';
import 'package:boxoniq/screens/previewBundal.dart';
import 'package:boxoniq/screens/productditels.dart';
import 'package:boxoniq/screens/profile.dart';
import 'package:boxoniq/screens/recommend.dart';
import 'package:boxoniq/screens/referral.dart';
import 'package:boxoniq/screens/story.dart';
import 'package:boxoniq/screens/storydetails.dart';
import 'package:boxoniq/screens/subscription.dart';
import 'package:boxoniq/screens/subsdetail.dart';
import 'package:boxoniq/screens/subshistory.dart';
import 'package:boxoniq/screens/thankyou.dart';
import 'package:boxoniq/screens/trackorder.dart';
import 'package:boxoniq/screens/webview.dart';
import 'package:boxoniq/splash/onbording.dart';
import 'package:boxoniq/splash/splashsceen.dart';
import 'package:boxoniq/util/storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:path_provider_ios/path_provider_ios.dart';

import 'screens/policies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.getInstance();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((event) {
    // {HEADER: head, body: body, message: title, intent-type: HOME, type: TEXT, id: inte}

    print('${event.data}----------------------');
    showThisNotification(event.data);
  });
  FirebaseMessaging.instance.subscribeToTopic('news');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Boxoniq',
        // theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'sen'),
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
          // "/subsdetail": (context) => Subsdetail(),
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
          "/productditels": (context) => ProductDitels(),
          "/faq": (context) => Faq(),
          "/subshistory": (context) => Subshistory(),
          "/community": (context) => Community(),
          "/communitysearch": (context) => Communitysearch(),
          "/cummunityonboard": (context) => Cummunityonboard(),
          "/communitydetail": (context) => Communitydetail(),
          "/story": (context) => Story(),
          "/mysubsdetail": (context) => Mysubsrdetail(),
          "/referral": (context) => Referral(),
          "/editaddress": (context) => Editaddress(),
          "/storydetails": (context) => Storydetails(),
          "/newaddress": (context) => Newaddress(),
          "/changeaddress": (context) => Changeaddress(),
          "/trackorder": (context) => Trackorder(),
          "/webview": (context) => Webview(),
          "/communityquestions": (context) => Communityquestions(),
          "/about": (context) => About(),
          "/resetpassword": (context) => Resetpassword(),
          "/newpass": (context) => Newpass(),
          "/recommend": (context) => Recommend(),
        });
  }
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'Boxoniq', // id
  'Boxoniq', // title
  importance: Importance.max,

  playSound: true,
  sound: RawResourceAndroidNotificationSound('notification'),
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Platform.isAndroid) PathProviderAndroid.registerWith();
  if (Platform.isIOS) PathProviderIOS.registerWith();

  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');

  print(message.data);
  await FirebaseMessaging.instance.subscribeToTopic('news');

  showThisNotificationInbg(message.data);
}
