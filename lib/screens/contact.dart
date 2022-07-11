import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  Future getPdf(Uint8List screenShot) async {
    pw.Document pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Expanded(
            // change this line to this:
            child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain),
          );
        },
      ),
    );
    var status = await Permission.storage.status;
    var status2 = await Permission.accessMediaLocation;
    if (!status.isGranted) {
      await Permission.storage.request();
    } else if (status2.isGranted == false) {
      await Permission.accessMediaLocation.request();
      await (Permission.manageExternalStorage);
    }

    Directory? appDocDir = Directory('/storage/emulated/0/');
    String appDocPath = appDocDir.path;

    File pdfFile = File('$appDocPath/demoTextFile.pdf');
    pdfFile.writeAsBytesSync(await pdf.save());
    Fluttertoast.showToast(msg: "$appDocPath saved ");
  }

  @override
  Widget build(BuildContext context) {
    homebloc.fetchnumbers();
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
              // fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<NumberModal>(
            stream: homebloc.getnumber.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return Column(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Text(
                      'For any service related queries you can contact us anytime between 10 AM to 6 PM (Mon-Sat) at',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Screenshot(
                    controller: screenshotController,
                    child: Padding(
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
                              offset:
                                  Offset(1, 3), // changes position of shadow
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
                                  String url =
                                      "https://wa.me/91${snapshot.data!.mobile}";
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "WHATSAPP",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data!.mobile!,
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
                                  String url =
                                      "tel:'${snapshot.data!.mobile!}'";
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "WORK",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        Text(
                                          snapshot.data!.phone!,
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
                                  String _urlmail =
                                      'mailto:${snapshot.data!.email!}';
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "EMAIL",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data!.email!,
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
                          InkWell(
                            onTap: () {
                              screenshotController
                                  .capture(delay: Duration(milliseconds: 10))
                                  .then((capturedImage) async {
                                print("sucess");
                                getPdf(capturedImage!);
                                // ShowCapturedWidget(context, capturedImage!);
                              }).catchError((onError) {
                                print(onError);
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Enquiry Form',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  )),
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
                                    controller: emailController,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                        labelText: 'Email',
                                        // border: InputBorder.none,
                                        hintText: 'Enter Your Email',
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
                                        hintText: 'Please write your Comment',
                                        hintStyle: TextStyle(fontSize: 12))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              if (nameController.text == "" ||
                                  phoneController.text == "" ||
                                  commentController.text == "") {
                                Fluttertoast.showToast(
                                    msg: 'Fill all the forms',
                                    backgroundColor: Colors.red);
                                return;
                              }
                              AuthApi _api = AuthApi();
                              Map data = await _api.contactForm(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  msg: commentController.text) as Map;
                              print(data);
                              if (data['response'] == '1') {
                                setState(() {
                                  commentController.text = "";
                                });
                                Fluttertoast.showToast(
                                    msg: data['msg'],
                                    backgroundColor: Colors.green);
                              } else {
                                Fluttertoast.showToast(
                                    msg: data['msg'],
                                    backgroundColor: Colors.red);
                              }
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
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
              );
            }),
      ),
    );
  }
}
