import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

TextEditingController _emailController = TextEditingController();

TextEditingController _pwdController = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      "Sign in ",
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
                    Text(
                      "Welcome Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Color(0xff000e29),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hello there, sign in to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.grey[400],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Email",
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
                      // num: 10,
                      controller: _emailController,
                      hinttext: "Enter Your Email",
                      // keyboardType: TextInputType.number,
                      // icon: (Icons.email),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Password",
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: TextField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: _pwdController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,

                          fillColor: Color.fromARGB(255, 255, 255, 255),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          hintText: "Enter Your Password",
                          // icon: Icon(
                          //   icon,
                          //   color: Colors.black,
                          // ),
                        ),
                      ),
                    ),
                    // FormTTextFild(
                    //   obscureText: true,
                    //   enableSuggestions: false,
                    //   autocorrect: false,
                    //   controller: _pwdController,
                    //   hinttext: "Enter Your Password",
                    //   // icon: (Icons.email),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    isLoging == true
                        ? Center(child: CircularProgressIndicator())
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          // if ((_emailController.text).length <= 9) {
                          //   Fluttertoast.showToast(
                          //       msg: "Invalid Login!",
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.BOTTOM,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Colors.red,
                          //       textColor: Colors.white,
                          //       fontSize: 16.0);
                          //   return;
                          // } else
                          if (_pwdController.text == " " ||
                              _pwdController.text == "") {
                            Fluttertoast.showToast(
                                msg: "Invalid pwd!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            return;
                          } else if (_emailController.text == " " ||
                              _emailController.text == "") {
                            Fluttertoast.showToast(
                                msg: "Invalid pwd!",
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
                            Map data = await _authapi.doLogin(
                              pwd: "${_pwdController.text}",
                              shopownerphone: "${_emailController.text}",
                            );
                            print(data["response"].runtimeType);

                            if (data['response'] == '1') {
                              userCred.addUserId('${data['accountId']}');
                              Future.delayed(Duration(seconds: 0), () {
                                Navigator.pushReplacementNamed(
                                    context, "/StartScreen");
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
                              "Sign in ",
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
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
