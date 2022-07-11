import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Addressbook extends StatefulWidget {
  const Addressbook({Key? key}) : super(key: key);

  @override
  State<Addressbook> createState() => _AddressbookState();
}

class _AddressbookState extends State<Addressbook> {
  @override
  void initState() {
    super.initState();
    getMydata();
    selectAddress();
  }

  getMydata() {
    // homebloc.liveAddress.listen((value) {
    //   addressController.text = value.addess!;
    //   pincodeController.text = value.pincode!;
    //   landmarkController.text = value.landmark!;
    // });
  }

  selectAddress() async {
    Map a = await homeApi.fetchaddessHome();
    // print('yaha dekh ==========');
    // print(a['address'][0]['id']);
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
    homebloc.fetchState();
    // final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    // print(rcvdData['activeIndex']);
    // print(rcvdData['activeIndex'].runtimeType);
    // print(rcvdData['total_amount']);
    // print(rcvdData['subs']);

    return Scaffold(
        backgroundColor: grad1Color,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: lightWhite2,
          title: const Text(
            "Address",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                // fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),

                  StreamBuilder<AddressListModal>(
                      stream: homebloc.getAddress.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return Column(
                          children: [
                            Column(
                              children: List.generate(
                                  snapshot.data!.data.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(5.0),
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
                                              padding: const EdgeInsets.all(15),
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
                                                    offset: const Offset(1,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(Icons.home)),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.blue),
                                                          shape:
                                                              BoxShape.circle,
                                                          color: addressId ==
                                                                  snapshot
                                                                      .data!
                                                                      .data[
                                                                          index]
                                                                      .id
                                                              ? Colors.blue
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 80,
                                                                child: Text(
                                                                  'Name ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .name!),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 80,
                                                                child: Text(
                                                                  'Address ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    2,
                                                                child: Text(snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .fulladdress!),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 80,
                                                                child: Text(
                                                                  'LandMark',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .landmark!),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 80,
                                                                child: Text(
                                                                  'Pincode ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .pincode!),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 80,
                                                                child: Text(
                                                                  'State ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .state!),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 80,
                                                                child: Text(
                                                                  'Phone ',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .phone!),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 2,
                                                          ),
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      '/editaddress',
                                                                      arguments: {
                                                                        'address': snapshot
                                                                            .data!
                                                                            .data[index]
                                                                            .fulladdress,
                                                                        'id': snapshot
                                                                            .data!
                                                                            .data[index]
                                                                            .id,
                                                                        'landmark': snapshot
                                                                            .data!
                                                                            .data[index]
                                                                            .landmark,
                                                                        'pincode': snapshot
                                                                            .data!
                                                                            .data[index]
                                                                            .pincode,
                                                                        'state': snapshot
                                                                            .data!
                                                                            .data[index]
                                                                            .state,
                                                                        'phone': snapshot
                                                                            .data!
                                                                            .data[index]
                                                                            .phone,
                                                                        'name': snapshot
                                                                            .data!
                                                                            .data[index]
                                                                            .name
                                                                      });
                                                                },
                                                                child:
                                                                    const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: Icon(
                                                                    Icons.edit,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  AuthApi
                                                                      _authapi =
                                                                      AuthApi();
                                                                  try {
                                                                    Map data =
                                                                        await _authapi
                                                                            .deleteAddress(
                                                                      addresssid: snapshot
                                                                          .data!
                                                                          .data[
                                                                              index]
                                                                          .id!,
                                                                    );
                                                                    // print(data[
                                                                    //         "response"]
                                                                    //     .runtimeType);

                                                                    if (data[
                                                                            'response'] ==
                                                                        '1') {
                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      Fluttertoast.showToast(
                                                                          msg:
                                                                              " ${data['msg']}! ",
                                                                          toastLength: Toast
                                                                              .LENGTH_SHORT,
                                                                          gravity: ToastGravity
                                                                              .BOTTOM,
                                                                          timeInSecForIosWeb:
                                                                              1,
                                                                          backgroundColor: Colors
                                                                              .red,
                                                                          textColor: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              16.0);
                                                                    }
                                                                  } catch (e) {}
                                                                },
                                                                child:
                                                                    const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      )),
                            ),
                            const SizedBox(
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
                  //       // fontFamily: font,
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
                  //       // fontFamily: font,
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
                  //       // fontFamily: font,
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

                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/newaddress');
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
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
