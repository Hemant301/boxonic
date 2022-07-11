import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

TextEditingController _phoneController = TextEditingController();

TextEditingController _pwdController = TextEditingController();

class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  bool isLoging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
                  //   child: Icon(
                  //     Icons.arrow_back_ios_new,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, left: 30),
                    child: Text(
                      "Reset Password",
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Enter your phone number to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormTTextFild(
                      num: 10,
                      controller: _phoneController,
                      hinttext: "Enter Your phone number",

                      keyboardType: TextInputType.number,
                      // icon: (Icons.email),
                    ),
                    SizedBox(
                      height: 50,
                      child: isLoging == true
                          ? Center(child: CircularProgressIndicator())
                          : Container(),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          if (_phoneController.text == " " ||
                              _phoneController.text == "") {
                            Fluttertoast.showToast(
                                msg: "Invalid Mobile number!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          }
                          setState(() {
                            isLoging = true;
                          });

                          AuthApi _authapi = AuthApi();
                          try {
                            Map data = await _authapi.doLoginotp(
                              phone: "${_phoneController.text}",
                            );
                            print(data["response"].runtimeType);

                            if (data['response'] == '1') {
                              // userCred.addUserId('${data['accountId']}');
                              Future.delayed(Duration(seconds: 0), () {
                                Navigator.pushNamed(context, '/newpass',
                                    arguments: {
                                      'ACCId': data['accountId'],
                                      "mobile": _phoneController.text
                                    });
                              });
                              Fluttertoast.showToast(
                                  msg: "${data['message']}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              setState(() {
                                isLoging = false;
                              });
                              Fluttertoast.showToast(
                                  msg: " ${data['message']}! ",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                isLoging = false;
                              });
                            }
                          } catch (e) {}

                          // Navigator.pushReplacementNamed(context, '/main');
                        },
                        //  {
                        //   Navigator.pushNamed(context, "/creat");
                        // },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 90,
                          decoration: BoxDecoration(
                              color: lightWhite3,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
