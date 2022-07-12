import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sms_autofill/sms_autofill.dart';

class Newpass extends StatefulWidget {
  const Newpass({Key? key}) : super(key: key);

  @override
  State<Newpass> createState() => _NewpassState();
}

class _NewpassState extends State<Newpass> {
  bool? isLoading;
  @override
  TextEditingController otpCon = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  String acid = "";
  String mobile = "";
  void initState() {
    otpCon = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    print("${data['ACCId']}}-------------123");
    acid = data['ACCId'];
    mobile = data['mobile'];
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
                        "New Password",
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
              Text('Enter the OTP and new password'),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "OTP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 0),
                        child: PinInputTextField(
                          controller: otpCon,
                          pinLength: 6,
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
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.grey[500],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTTextFild(
                      hinttext: 'Enter New Password',
                      controller: pwdController,
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
                          print(mobile);
                          print(pwdController.text);

                          if (otpCon.text == '' || pwdController.text == "") {
                            // show error
                            Fluttertoast.showToast(
                                msg: "Enter all field!",
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
                            Map data = await _authApi.resetPassword(
                                otp: otpCon.text,
                                phone: mobile,
                                password: pwdController.text);
                            print(data);

                            if (data['response'].toString() == '1') {
                              setState(() {
                                isLoading = false;
                              });
                              // userCred.addUserId(acid);
                              Future.delayed(Duration(seconds: 0), () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/StartScreen',
                                    ModalRoute.withName('/login'));
                              });
                              Fluttertoast.showToast(
                                  msg: data['message'],
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
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
                  ],
                ),
              ),
            ])));
  }
}
