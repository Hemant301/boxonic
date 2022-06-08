import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sms_autofill/sms_autofill.dart';

class Loginotp extends StatefulWidget {
  const Loginotp({Key? key}) : super(key: key);

  @override
  State<Loginotp> createState() => _LoginotpState();
}

class _LoginotpState extends State<Loginotp> {
  bool? isLoading;
  @override
  late TextEditingController otpCon;
  String acid = "";
  void initState() {
    otpCon = TextEditingController();
    SmsAutoFill().getAppSignature.then((value) => print(value));
    super.initState();
  }

  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    // print("${data['ACCId']}}-------------123");
    acid = data['ACCId'];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  color: lightWhite3,
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(50),
                  //     bottomRight: Radius.circular(50))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: Icon(
                    //       Icons.arrow_back,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50, left: 30),
                      child: Text(
                        "OTP",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                    ),
                  ],
                ),
              ),
              Text('Enter the OTP'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: PinInputTextField(
                    controller: otpCon,
                    pinLength: 5,
                    cursor: Cursor(
                      width: 2,
                      height: 30,
                      color: Colors.black,
                      enabled: true,
                    ),
                    decoration: UnderlineDecoration(
                      colorBuilder: FixedColorBuilder(Colors.black),
                      lineHeight: 1.0,
                      textStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () async {
                    print(otpCon.text);

                    if (otpCon.text == '') {
                      // show error
                      Fluttertoast.showToast(
                          msg: "Invalid otp!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      print(otpCon.text);
                      print(acid);
                      setState(() {
                        isLoading = true;
                      });

                      AuthApi _authApi = AuthApi();
                      Map data = await _authApi.dologinvERIFY(
                        otp: otpCon.text,
                        accid: acid,
                      );
                      print(data);

                      if (data['response'] == '1') {
                        setState(() {
                          isLoading = false;
                        });
                        userCred.addUserId(acid);
                        Future.delayed(Duration(seconds: 0), () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/StartScreen', ModalRoute.withName('/login'));
                        });
                        Fluttertoast.showToast(
                            msg: data['message'],
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (data['status'] == 200) {
                        Fluttertoast.showToast(
                            msg: data['message'],
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        setState(() {
                          isLoading = false;
                        });
                        //? Wrong
                        // setState(() {
                        //   errorMsg = 'Wrong Otp';
                        // });
                      }
                    }
                    return;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(color: lightWhite3),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Text(
                          'Next',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
