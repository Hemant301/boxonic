import 'dart:convert';
import 'dart:io';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/constance.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';

class Token extends StatefulWidget {
  const Token({Key? key}) : super(key: key);

  @override
  _TokenState createState() => _TokenState();
}

class _TokenState extends State<Token> {
  String _token = ' ';
  Stream<String>? _tokenStream;
  void setToken(String token) {
    print('FCM Token: $token');
    setTokenApi(token);
  }

  Future<dynamic> setTokenApi(String tokenkey) async {
    var client = http.Client();
    try {
      final response = await client.post(Uri.parse("${base}token-register.php"),
          body: {'user_id': userCred.getUserId(), 'token': tokenkey});
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    FirebaseMessaging.instance
        .getToken(
            vapidKey:
                'BBMEKrvugfUwTWEBC_A87sKnZub9cEPvM-NiwZnz3D6LoMe6AMsPyRrbo3mXs6nM9CaiZK1a_ovdwWyVy0egzVI')
        .then((_token) {
      setToken(_token ?? ' ');
    });

    super.initState();

    // _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    // _tokenStream!.listen(setToken);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// void send() {
//   print('object');
//   Navigator.pushNamed(
//     MyApp.navigatorKey.currentState!.context,
//     '/vcall',
//   );
// }

int nav = 0;
String agoratoken = "";
String user_id = "";
String type = "";
String processid = "";
String astroImage = "";
String astroName = "";
String dob = "";
String tob = "";
String pob = "";
String gender = "";
String cus_name = "";
String state = "";
String district = "";
String country = "";

showThisNotificationInbg(data) {
  print(data);
  print('-------------------------------------');
  String link = '/';
  if (data['intent-type'] == 'PRODUCT') {
    link = '/product/detail';
  } else if (data['intent-type'] == 'CHILD') {
    link = '/product';
  } else {
    link = '/';
  }
  //{HEADER: d, body: d, message: nwdj, intent-type: HOME, type: IMAGE, id: d, image: https://cityindia.in/gcm-media/16298763432019260076emptycart.png}
  if (data['type'] == 'IMAGE') {
    showBigPictureNotification(
        body: data['body'] ?? ' ',
        image: data['image'] ?? ' ',
        title: data['message'] ?? ' ',
        link: link,
        args: data['id'] ?? ' ');
  } else {
    _showNotification(
        body: data['body'] ?? ' ',
        title: data['message'] ?? ' ',
        link: link,
        args: data['id'] ?? ' ');
  }
}

showThisNotification(data) {
  print(data);
  print('-------------------------------------');
  print(data['booking_type']);

  String link = '/';
  if (data['booking_type'] == 'VIDEOCALL') {
    agoratoken = data['agora_token'];
    user_id = data['user_id'];
    processid = data['process_id'];
    type = data['booking_type'];

    astroImage = data['user_img'];
    astroName = data['user_name'];
    dob = data['dob'];
    tob = data['tob'];
    pob = data['place'];
    gender = data['gender'];
    cus_name = data['name'];
    state = data['state'];
    district = data['district'];
    country = data['country'];

    link = '/vcall';
    // Navigator.pushNamed(MyApp.navigatorKey.currentState!.context, '/vcall',
    //     arguments: {
    //       'token': agoratoken,
    //       'user_id': user_id,
    //       'processid': processid,
    //       'img': astroImage,
    //       'name': astroName,
    //       'pob': pob,
    //       'tob': tob,
    //       'dob': dob,
    //       'gender': gender,
    //       'cus_name': cus_name,
    //       'state': state,
    //       'district': district,
    //       'country': country,
    //     });
    //   nav = 1;
    // } else if (data['booking_type'] == 'VOICECALL') {
    //   agoratoken = data['agora_token'];
    //   user_id = data['user_id'];
    //   type = data['booking_type'];
    //   processid = data['process_id'];
    //   astroImage = data['user_img'];
    //   astroName = data['user_name'];
    //   dob = data['dob'];
    //   tob = data['tob'];
    //   pob = data['place'];
    //   gender = data['gender'];
    //   cus_name = data['name'];
    //   state = data['state'];
    //   district = data['district'];
    //   country = data['country'];

    //   nav = 2;
    // Navigator.pushReplacementNamed(
    //     MyApp.navigatorKey.currentState!.context, '/acall',
    //     arguments: {
    //       'audiotoken': agoratoken,
    //       'userid': user_id,
    //       'type': type,
    //       'processid': processid,
    //       'img': astroImage,
    //       'name': astroName,
    //       'pob': pob,
    //       'tob': tob,
    //       'dob': dob,
    //       'gender': gender,
    //       'cus_name': cus_name,
    //       'state': state,
    //       'district': district,
    //       'country': country,
    //       'event':'unlock'
    //     });

    // link = '/product';
    print('$nav------------nav');
  } else if (data['booking_type'] == null) {
    nav = 0;
    // link = '/product';
    print('$nav------------nav');
  } else {
    link = '/';

    type = data['booking_type'];
  }
  print('$agoratoken------------token');
  //{HEADER: d, body: d, message: nwdj, intent-type: HOME, type: IMAGE, id: d, image: https://cityindia.in/gcm-media/16298763432019260076emptycart.png}
  if (data['type'] == 'IMAGE') {
    showBigPictureNotification(
        body: data['body'] ?? ' ',
        image: data['image'] ?? ' ',
        title: data['message'] ?? ' ',
        link: link,
        args: data['id'] ?? ' ');
  } else {
    _showNotification(
        body: data['body'] ?? ' ',
        title: data['message'] ?? ' ',
        link: link,
        args: data['id'] ?? ' ');
  }
}

Future<void> _showNotification(
    {String body = '',
    String title = '',
    String link = '',
    String args = ' '}) async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            // didReceiveLocalNotificationSubject.add(
            //   ReceivedNotification(
            //     id: id,
            //     title: title,
            //     body: body,
            //     payload: payload,
            //   ),
            // );
          });
  const MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS,
  );
  // nav == 2
  //     ? await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //         onSelectNotification: (String? payload) async {
  //         try {
  //           await Navigator.pushNamed(
  //               MyApp.navigatorKey.currentState!.context, '/vcall',
  //               arguments: {'token': agoratoken, 'user_id': user_id});
  //         } catch (e) {
  //           print(e.toString());
  //         }
  //         if (payload != null) {
  //           debugPrint('notification payload: $payload-------------');

  //           Navigator.pushNamed(
  //               MyApp.navigatorKey.currentState!.context, '/vcall',
  //               arguments: {'token': agoratoken, 'user_id': user_id});
  //         }
  //       })
  //     : await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //         onSelectNotification: (String? payload) async {
  //         try {
  //           await Navigator.pushNamed(
  //             MyApp.navigatorKey.currentState!.context,
  //             '/main',
  //           );
  //         } catch (e) {
  //           print(e.toString());
  //         }
  //         if (payload != null) {
  //           print(payload);
  //           debugPrint('notification payload: $payload--------0-----');
  //         }
  //       });
  nav == 1
      ? await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: (String? payload) async {
          try {
            await Navigator.pushReplacementNamed(
                MyApp.navigatorKey.currentState!.context, '/splash',
                arguments: {
                  'token': agoratoken,
                  'user_id': user_id,
                  'type': type,
                  'processid': processid,
                  'img': astroImage,
                  'name': astroName,
                  'pob': pob,
                  'tob': tob,
                  'dob': dob,
                  'gender': gender,
                  'cus_name': cus_name,
                  'state': state,
                  'district': district,
                  'country': country,
                });
          } catch (e) {
            print(e.toString());
          }
          if (payload != null) {
            debugPrint('notification payload: $payload-------------');

            Navigator.pushNamed(
                MyApp.navigatorKey.currentState!.context, '/splash',
                arguments: {
                  'token': agoratoken,
                  'user_id': user_id,
                  'type': type,
                  'processid': processid,
                  'img': astroImage,
                  'name': astroName,
                  'pob': pob,
                  'tob': tob,
                  'dob': dob,
                  'gender': gender,
                  'cus_name': cus_name,
                  'state': state,
                  'district': district,
                  'country': country,
                });
          }
        })
      : await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: (String? payload) async {
          try {
            await Navigator.pushNamed(
                MyApp.navigatorKey.currentState!.context, '/splash',
                arguments: {
                  'token': agoratoken,
                  'user_id': user_id,
                  'type': type,
                  'processid': processid,
                  'img': astroImage,
                  'name': astroName,
                  'pob': pob,
                  'tob': tob,
                  'dob': dob,
                  'gender': gender,
                  'cus_name': cus_name,
                  'state': state,
                  'district': district,
                  'country': country,
                });
          } catch (e) {
            print(e.toString());
          }
          if (payload != null) {
            print(payload);
            debugPrint('notification payload: $payload--------1-----');
            Navigator.pushNamed(
                MyApp.navigatorKey.currentState!.context, '/splash',
                arguments: {
                  'token': agoratoken,
                  'user_id': user_id,
                  'type': type,
                  'processid': processid,
                  'img': astroImage,
                  'name': astroName,
                  'pob': pob,
                  'tob': tob,
                  'dob': dob,
                  'gender': gender,
                  'cus_name': cus_name,
                  'state': state,
                  'district': district,
                  'country': country,
                });
          }
        });
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'Boxoniq',
    'Boxoniq',
    importance: Importance.max,
    priority: Priority.max,
    enableLights: true,
    // fullScreenIntent: true,
    enableVibration: true,
    playSound: false,
    // sound: RawResourceAndroidNotificationSound('notification'),
  );
  print('sound----------------------------------------1111');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin
      .show(0, '$title', '$body', platformChannelSpecifics, payload: 'item x');
}

Future<void> showBigPictureNotification(
    {String body = '',
    String title = '',
    String image = '',
    String link = '',
    String args = ' '}) async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            // didReceiveLocalNotificationSubject.add(
            //   ReceivedNotification(
            //     id: id,
            //     title: title,
            //     body: body,
            //     payload: payload,
            //   ),
            // );
          });
  const MacOSInitializationSettings initializationSettingsMacOS =
      MacOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    try {
      await Navigator.pushNamed(
          MyApp.navigatorKey.currentState!.context, '/main',
          arguments: {'allorder': true});
    } catch (e) {
      print(e.toString());
    }
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  });

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  final String largeIconPath =
      await _downloadAndSaveFile('$image', 'largeIcon');
  print(image);
  final String bigPicturePath =
      await _downloadAndSaveFile('$image', 'bigPicture');
  final BigPictureStyleInformation bigPictureStyleInformation =
      BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
          largeIcon: FilePathAndroidBitmap(largeIconPath),
          contentTitle: '$title ',
          htmlFormatContentTitle: true,
          summaryText: '$body ',
          htmlFormatSummaryText: true);
  final AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('Boxoniq', 'Boxoniq',
          importance: Importance.max,
          priority: Priority.max,
          playSound: false,
          // fullScreenIntent: true,
          enableLights: true,
          enableVibration: true,
          // sound: RawResourceAndroidNotificationSound('notification'),
          styleInformation: bigPictureStyleInformation);
  // print('sound222222222222222');
  final NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0, '$title', '$body', platformChannelSpecifics);
}
