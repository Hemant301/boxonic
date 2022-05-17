import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:boxoniq/util/textfild.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Addressbook extends StatefulWidget {
  const Addressbook({Key? key}) : super(key: key);

  @override
  State<Addressbook> createState() => _AddressbookState();
}

class _AddressbookState extends State<Addressbook> {
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMydata();
    selectAddress();
  }

  getMydata() {
    homebloc.liveAddress.listen((value) {
      addressController.text = value.addess!;
      pincodeController.text = value.pincode!;
      landmarkController.text = value.landmark!;
    });
  }

  selectAddress() async {
    Map a = await homeApi.fetchaddessHome();
    print('yaha dekh ==========');
    print(a['address'][0]['id']);
    setState(() {
      addressId = a['address'][0]['id'].toString();
    });

    // print(a['a'])
  }

  String addressId = '0';

  @override
  Widget build(BuildContext context) {
    // homebloc.fetchaddess();
    homebloc.fetchListAddress();
    // final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    // print(rcvdData['activeIndex']);
    // print(rcvdData['activeIndex'].runtimeType);
    // print(rcvdData['total_amount']);
    // print(rcvdData['subs']);

    return Scaffold(
        backgroundColor: grad1Color,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: lightWhite2,
          title: Text(
            "Address Book",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),

                  StreamBuilder<AddressListModal>(
                      stream: homebloc.getAddress.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        return Column(
                          children: [
                            Column(
                              children: List.generate(
                                  snapshot.data!.data.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              addressId = snapshot
                                                  .data!.data[index].id!
                                                  .toString();
                                            });
                                          },
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  20,
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                                // border: Border.all(color: Colors.blue, width: 1),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: Offset(1,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue),
                                                      shape: BoxShape.circle,
                                                      color: addressId ==
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .id
                                                          ? Colors.blue
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(snapshot
                                                          .data!
                                                          .data[index]
                                                          .fulladdress!),
                                                      Text(snapshot
                                                          .data!
                                                          .data[index]
                                                          .landmark!),
                                                      Text(snapshot
                                                          .data!
                                                          .data[index]
                                                          .pincode!),
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      )),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        );
                      }),

                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     "Address",
                  //     style: TextStyle(
                  //       letterSpacing: 1,
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //       fontFamily: font,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width - 25,
                  //   // padding: EdgeInsets.all(5),
                  //   child: FormTTextFild(
                  //     controller: addressController,
                  //     maxLines: 4,
                  //     hinttext: "Enter Your Address",

                  //     // icon: (Icons.email),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     // color: Colors.white,
                  //     // border: Border.all(color: Colors.blue, width: 1),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     "Pincode",
                  //     style: TextStyle(
                  //       letterSpacing: 1,
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //       fontFamily: font,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width - 40,
                  //   padding: EdgeInsets.all(5),
                  //   child: FormTTextFild(
                  //     controller: pincodeController,
                  //     hinttext: "Enter Your Pincode",
                  //     // icon: (Icons.email),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),

                  //     // border: Border.all(color: Colors.blue, width: 1),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Text(
                  //     "Landmark",
                  //     style: TextStyle(
                  //       letterSpacing: 1,
                  //       fontSize: 16,
                  //       color: Colors.black,
                  //       fontFamily: font,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width - 40,
                  //   padding: EdgeInsets.all(5),
                  //   child: FormTTextFild(
                  //     controller: landmarkController,
                  //     hinttext: "Enter Your LandMark",
                  //     // icon: (Icons.email),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     // color: Colors.white,
                  //     // border: Border.all(color: Colors.blue, width: 1),

                  //     // boxShadow: [
                  //     //   BoxShadow(
                  //     //     color: Colors.grey.withOpacity(0.4),
                  //     //     spreadRadius: 1,
                  //     //     blurRadius: 1,
                  //     //     offset: Offset(1, 3), // changes position of shadow
                  //     //   ),
                  //     // ],
                  //   ),
                  // ),

                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (builder) {
                            return new Container(
                              height: MediaQuery.of(context).size.height,
                              // height: 1000,
                              color: Colors
                                  .transparent, //could change this to Color(0xFF737373),
                              //so you don't have to change MaterialApp canvasColor
                              child: new Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: new BoxDecoration(
                                      color: Color.fromARGB(255, 226, 226, 226),
                                      borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight:
                                              const Radius.circular(10.0))),
                                  child: new Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(Icons.arrow_back),
                                                )),
                                            Icon(Icons.close)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Address",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                25,
                                        // padding: EdgeInsets.all(5),
                                        child: FormTTextFild(
                                          controller: addressController,
                                          maxLines: 4,
                                          hinttext: "Enter Your Address",

                                          // icon: (Icons.email),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color: Colors.white,
                                          // border: Border.all(color: Colors.blue, width: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Pincode",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        padding: EdgeInsets.all(5),
                                        child: FormTTextFild(
                                          controller: pincodeController,
                                          hinttext: "Enter Your Pincode",
                                          // icon: (Icons.email),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),

                                          // border: Border.all(color: Colors.blue, width: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Landmark",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: font,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        padding: EdgeInsets.all(5),
                                        child: FormTTextFild(
                                          controller: landmarkController,
                                          hinttext: "Enter Your LandMark",
                                          // icon: (Icons.email),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color: Colors.white,
                                          // border: Border.all(color: Colors.blue, width: 1),

                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     color: Colors.grey.withOpacity(0.4),
                                          //     spreadRadius: 1,
                                          //     blurRadius: 1,
                                          //     offset: Offset(1, 3), // changes position of shadow
                                          //   ),
                                          // ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          AuthApi _authapi = AuthApi();
                                          try {
                                            Map data =
                                                await _authapi.doSaveAddress(
                                                    address:
                                                        addressController.text,
                                                    landmark:
                                                        landmarkController.text,
                                                    pincode:
                                                        pincodeController.text);
                                            print(data["response"].runtimeType);

                                            if (data['response'] == '1') {
                                              setState(() {});
                                              Navigator.pop(context);

                                              // Future.delayed(
                                              //     Duration(seconds: 0), () {
                                              //   if (rcvdData['activeIndex'] ==
                                              //       1) {
                                              //     Navigator.pushNamed(
                                              //         context, "/subscription",
                                              //         arguments: {
                                              //           'total_amount':
                                              //               rcvdData[
                                              //                   'total_amount'],
                                              //           'subs': rcvdData['subs']
                                              //         });
                                              //   } else {
                                              //     Navigator.pushNamed(
                                              //         context, "/checkwallet",
                                              //         arguments: {
                                              //           'total_amount':
                                              //               rcvdData[
                                              //                   'total_amount'],
                                              //           'month': '0',
                                              //           'subs': rcvdData['subs']
                                              //         });
                                              //   }
                                              // });
                                              // Fluttertoast.showToast(
                                              //     msg: "${data['msg']}",
                                              //     toastLength:
                                              //         Toast.LENGTH_SHORT,
                                              //     gravity: ToastGravity.BOTTOM,
                                              //     timeInSecForIosWeb: 1,
                                              //     backgroundColor: Colors.green,
                                              //     textColor: Colors.white,
                                              //     fontSize: 16.0);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: " ${data['msg']}! ",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                          } catch (e) {}
                                        },
                                        child: Container(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              40,
                                          decoration: BoxDecoration(
                                              color: lightWhite2,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              "Next ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '+ Add Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
