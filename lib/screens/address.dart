import 'package:boxoniq/api/authApi.dart';
import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/shimmer/newshimmer.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String statename = "";
  @override
  void initState() {
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
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
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
                          return Billing_shimmer(
                            width: 40,
                            number: 4,
                          );
                        }
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
                                              padding: const EdgeInsets.all(20),
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
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(snapshot.data!
                                                          .data[index].name!),
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
                                                      Text(snapshot.data!
                                                          .data[index].state!),
                                                      Text(snapshot.data!
                                                          .data[index].phone!),
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
                                                                        .data[
                                                                            index]
                                                                        .fulladdress,
                                                                    'id': snapshot
                                                                        .data!
                                                                        .data[
                                                                            index]
                                                                        .id,
                                                                    'landmark': snapshot
                                                                        .data!
                                                                        .data[
                                                                            index]
                                                                        .landmark,
                                                                    'pincode': snapshot
                                                                        .data!
                                                                        .data[
                                                                            index]
                                                                        .pincode,
                                                                    'state': snapshot
                                                                        .data!
                                                                        .data[
                                                                            index]
                                                                        .state,
                                                                    'phone': snapshot
                                                                        .data!
                                                                        .data[
                                                                            index]
                                                                        .phone,
                                                                    'name': snapshot
                                                                        .data!
                                                                        .data[
                                                                            index]
                                                                        .name
                                                                  });
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Icon(
                                                                Icons.edit,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          InkWell(
                                                            onTap: () async {
                                                              AuthApi _authapi =
                                                                  AuthApi();
                                                              try {
                                                                Map data =
                                                                    await _authapi
                                                                        .deleteAddress(
                                                                  addresssid:
                                                                      snapshot
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
                                                                      toastLength:
                                                                          Toast
                                                                              .LENGTH_SHORT,
                                                                      gravity: ToastGravity
                                                                          .BOTTOM,
                                                                      timeInSecForIosWeb:
                                                                          1,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                      textColor:
                                                                          Colors
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
                                                                      .all(5.0),
                                                              child: Icon(
                                                                Icons.delete,
                                                                size: 15,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      )),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            snapshot.data!.data.length == 0
                                ? Container()
                                : InkWell(
                                    onTap: () async {
                                      if (addressId == "0") {
                                        Fluttertoast.showToast(
                                            msg: 'Select Address');
                                        return;
                                      }

                                      try {
                                        if (rcvdData['activeIndex'] == 1) {
                                          Navigator.pushNamed(
                                              context, "/subscription",
                                              arguments: {
                                                'c_discount':
                                                    rcvdData['c_discount'],
                                                'b_discount':
                                                    rcvdData['b_discount'],
                                                'sub_total':
                                                    rcvdData['sub_total'],
                                                'address_id': addressId,
                                                'total_amount':
                                                    rcvdData['total_amount'],
                                                'subs': rcvdData['subs']
                                              });
                                        } else {
                                          Navigator.pushNamed(
                                              context, "/checkwallet",
                                              arguments: {
                                                'c_discount':
                                                    rcvdData['c_discount'],
                                                'b_discount':
                                                    rcvdData['b_discount'],
                                                'sub_total':
                                                    rcvdData['sub_total'],
                                                'address_id': addressId,
                                                'total_amount':
                                                    rcvdData['total_amount'],
                                                'month': '0',
                                                'subs': rcvdData['subs']
                                              });
                                        }
                                      } catch (e) {}
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                          color: lightWhite2,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Center(
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
                        );
                      }),
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
