import 'package:boxoniq/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';

class Referral extends StatefulWidget {
  const Referral({Key? key}) : super(key: key);

  @override
  State<Referral> createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  share(BuildContext context) {
    // final RenderBox box = context.findRenderObject();
    final RenderBox box = context.findRenderObject() as RenderBox;
    Share.share(
        '''Boxoniq -  https://play.google.com/store/apps/details?id=com.boxoniq.ctpl
Use my referral code $referralcode to get discount''',
        subject: 'Boxoniq',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width - 16,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Container(
                        // width: 100,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Refer and Earn',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                    Container(
                      width: 10,
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Lottie.asset('assets/refer.json', repeat: false, height: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              'Invite friends & earn flat ₹50 in your Boxoniq wallet, On their first purchase of minimum order of ₹ 500. ',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              share(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Invite Contact',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('or'),
          SizedBox(
            height: 20,
          ),
          Text(
            'Use your Code',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                referralcode,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: referralcode));
              Fluttertoast.showToast(msg: 'Coppied successfully');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Copy'),
                Icon(Icons.copy),
              ],
            ),
          )
        ],
      ),
    );
  }
}
