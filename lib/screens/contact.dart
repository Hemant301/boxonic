import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: lightWhite2,
        title: Text(
          "Contact Us",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width - 100,
              child: Lottie.asset(
                'assets/contact.json',
                // fit: BoxFit.cover,
              ),
            ),
            Text(
              'We are here to help you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Text(
                'For any service related queries or to book an appointment manually you can contact us anytime at',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  color: lightWhite2.withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () async {
                          String url = "tel:9798416091";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.mobile_friendly_outlined,
                              color: Color.fromARGB(255, 2, 2, 2),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MOBILE / WHATSAPP",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '9798416091',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: InkWell(
                        onTap: () async {
                          String url = "tel:9798416091";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "WORK",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                Text(
                                  '9798416091',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: InkWell(
                        onTap: () async {
                          String _urlmail = 'mailto:Santosh@gmail.com';
                          if (!await launch(_urlmail))
                            throw 'Could not launch $_urlmail';
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "EMAIL",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Santosh@gmail.com',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(
                        1,
                        2,
                      ), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Enquiry Form',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          )),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width - 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                              controller: nameController,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  labelText: 'Name',
                                  // border: InputBorder.none,
                                  hintText: 'Enter Your Name',
                                  hintStyle: TextStyle(fontSize: 12))),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width - 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                              controller: phoneController,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  // border: InputBorder.none,
                                  hintText: 'Enter Your Number',
                                  hintStyle: TextStyle(fontSize: 12))),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width - 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                              controller: commentController,
                              maxLines: 4,
                              decoration: const InputDecoration(
//                                       labelText: '''Please write your
// comments/queries/review ''',
//                                       labelStyle: TextStyle(fontSize: 12),
                                  // border: InputBorder.none,
                                  hintText: 'Please write your',
                                  hintStyle: TextStyle(fontSize: 12))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        // if (nameController.text == "" ||
                        //     phoneController.text == "" ||
                        //     commentController.text == "") {
                        //   Fluttertoast.showToast(
                        //       msg: 'Fill all the forms',
                        //       backgroundColor: Colors.red);
                        //   return;
                        // }
                        // AuthApi _api = AuthApi();
                        // Map data = await _api.contactForm(
                        //     name: nameController.text,
                        //     phone: phoneController.text,
                        //     comment: commentController.text) as Map;
                        // print(data);
                        // if (data['response'] == 1) {
                        //   setState(() {
                        //     commentController.text = "";
                        //   });
                        //   Fluttertoast.showToast(
                        //       msg: data['msg'], backgroundColor: Colors.green);
                        // } else {
                        //   Fluttertoast.showToast(
                        //       msg: data['msg'], backgroundColor: Colors.red);
                        // }
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber,
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
