import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/api/walletapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Checkwallet extends StatefulWidget {
  const Checkwallet({Key? key}) : super(key: key);

  @override
  State<Checkwallet> createState() => _CheckwalletState();
}

class _CheckwalletState extends State<Checkwallet> {
  void cashFreeOnlinepayment(
      {String amount = "",
      String is_wallet = "",
      String token = "",
      String orderId = "",
      String name = "",
      String phone = "",
      String monthamount = "",
      String email = ""}) {
    Map<String, dynamic> inputParams = {
      "orderId": '$orderId',
      "orderAmount": '$monthamount',
      "customerName": 'santosh',
      "orderCurrency": 'INR',
      "appId": '1520515e63d5612b1f28642840150251',
      "customerPhone": '9798416091',
      "customerEmail": 'santosh@gmail.com',
      'stage': 'test',
      'tokenData': '$token'
    };
    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) async {
              if (key == "txStatus" && value == "SUCCESS") {
                print('from succes');
                print(value);
                Map a = await homeApi.doPaymentOnline(
                    amount: amount,
                    monthamount: monthamount,
                    subs: '0',
                    month: monthname,
                    addressid: addressId,
                    is_wallet: is_wallet,
                    paymentid: orderId);

                if (a['response'].toString() == "1") {
                  Navigator.pushReplacementNamed(context, '/thankyou',
                      arguments: {'id': a['order-id']});
                }

                throw "";
              } else {
                // print('from fail');

                Fluttertoast.showToast(
                    msg: 'Failed', backgroundColor: Colors.red);
              }

              print("$key : $value");
              //Do something with the result
            }));
  }

  void cashFreeHalfpayment(
      {String amount = "",
      String is_wallet = "",
      String token = "",
      String orderId = "",
      String name = "",
      String phone = "",
      String monthamount = "",
      String email = ""}) {
    Map<String, dynamic> inputParams = {
      "orderId": '$orderId',
      "orderAmount": '$monthamount',
      "customerName": 'santosh',
      "orderCurrency": 'INR',
      "appId": '1520515e63d5612b1f28642840150251',
      "customerPhone": '9798416091',
      "customerEmail": 'santosh@gmail.com',
      'stage': 'test',
      'tokenData': '$token'
    };
    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) async {
              if (key == "txStatus" && value == "SUCCESS") {
                print('from succes');
                print(value);
                Map a = await walletApi.doSuccessPayment(
                    amount: monthamount, txnid: orderId) as Map;

                if (a['response'] == '1' || a['response'] == 1) {
                  homeApi.doPayment(
                    amount: amount,
                    subs: '0',
                    month: monthname,
                    addressid: addressId,
                  );

                  Navigator.pushReplacementNamed(context, '/thankyou',
                      arguments: {'id': a['order-id']});
                } else {}

                throw "";
              } else {
                // print('from fail');

              }

              print("$key : $value");
              //Do something with the result
            }));
  }

  String monthname = '1';
  String addressId = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    // print(rcvdData['activeIndex']);
    // print(rcvdData['activeIndex'].runtimeType);
    print(rcvdData['total_amount']);
    print(rcvdData['address_id']);
    addressId = rcvdData['address_id'];
    print(rcvdData['subs']);
    homebloc.fetchcalAmount();
    homebloc.getMonths();

    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Pay Now",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              // fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          // Center(
          //   child: Text(
          //     "₹ 9,785   ",
          //     style: TextStyle(
          //         letterSpacing: 1,
          //         fontSize: 18,
          //         color: grad2Color,
          //         // fontFamily: font,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(25),
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: StreamBuilder<CalAmountModal>(
                    stream: homebloc.getCalculatedAmount.stream,
                    builder: (context, snapshot) {
                      // print('++++++++++${snapshot.data!.data[0]}');
                      if (!snapshot.hasData) return Container();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Total",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 24,
                                  color: Colors.grey,
                                  // fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          // Text(
                          //   "₹ ${rcvdData['sub_total']}",
                          //   style: TextStyle(
                          //       letterSpacing: 1,
                          //       fontSize: 16,
                          //       color: Colors.black,
                          //       // fontFamily: font,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          SizedBox(
                            width: 30,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                // height: 60,
                                // width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Text(
                                    "₹ ${rcvdData['total_amount']}",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 24,
                                        color: Colors.black,
                                        // fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Positioned(
                                top: -20,
                                left: 70,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green,
                                    border: Border.all(
                                        color: Colors.blue, width: 1),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(
                                            1, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "₹ ${rcvdData['c_discount'] + rcvdData['b_discount']} off ",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.white,
                                        // fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
              SizedBox(
                height: 20,
              ),
              // StreamBuilder<CalAmountModal>(
              //     stream: homebloc.getCalculatedAmount.stream,
              //     builder: (context, snapshot) {
              //       // print('++++++++++${snapshot.data!.data[0]}');
              //       if (!snapshot.hasData) return Container();
              //       return Container(
              //         width: MediaQuery.of(context).size.width - 40,
              //         padding: EdgeInsets.all(20),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(5),
              //           color: Colors.white,
              //           border: Border.all(color: Colors.blue, width: 1),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey.withOpacity(0.4),
              //               spreadRadius: 1,
              //               blurRadius: 1,
              //               offset: Offset(1, 3), // changes position of shadow
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Column(
              //                   children: [
              //                     Text(
              //                       "Add ₹ ${rcvdData['total_amount']} x ",
              //                       style: TextStyle(
              //                           letterSpacing: 1,
              //                           fontSize: 12,
              //                           color: Colors.black,
              //                           // fontFamily: font,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                     SizedBox(
              //                       height: 3,
              //                     ),
              //                     StreamBuilder<MonthsModal>(
              //                         stream: homebloc.getLiveMonths.stream,
              //                         builder: (context, snapshot) {
              //                           if (!snapshot.hasData)
              //                             return Container();
              //                           return DropDown(
              //                             items: List.generate(
              //                                 snapshot.data!.data.length,
              //                                 (index) => snapshot
              //                                     .data!.data[index].months!),
              //                             hint: Text("Select Months"),
              //                             icon: Icon(
              //                               Icons.expand_more,
              //                               color: Colors.blue,
              //                             ),
              //                             onChanged: (s) {
              //                               monthname = s.toString();
              //                               setState(() {});
              //                             },
              //                           );
              //                         }),
              //                     // Text(
              //                     //   "Add ₹ 9785 x ",
              //                     //   style: TextStyle(
              //                     //       letterSpacing: 1,
              //                     //       fontSize: 12,
              //                     //       color: Colors.black,
              //                     //       // fontFamily: font,
              //                     //       fontWeight: FontWeight.bold),
              //                     // ),
              //                   ],
              //                 ),
              //                 Column(
              //                   children: [
              //                     Image.asset("assets/wallet (1) 3.png"),
              //                     SizedBox(
              //                       height: 3,
              //                     ),
              //                     Text(
              //                       "In Wallet",
              //                       style: TextStyle(
              //                           letterSpacing: 1,
              //                           fontSize: 12,
              //                           color: Colors.black,
              //                           // fontFamily: font,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       );
              //     }),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<CalAmountModal>(
                  stream: homebloc.getCalculatedAmount.stream,
                  builder: (context, snapshot) {
                    // print('++++++++++${snapshot.data!.data[0]}');
                    if (!snapshot.hasData) return Container();
                    return Column(
                      children: [
                        (rcvdData['total_amount']) * int.parse(monthname[0]) >
                                int.parse(snapshot
                                    .data!.data[0].response!.walletBallance)
                            ? snapshot.data!.data[0].response!.walletBallance ==
                                        '0' ||
                                    snapshot.data!.data[0].response!
                                            .walletBallance ==
                                        0
                                ? Container()
                                : InkWell(
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      String orderId = DateTime.now()
                                          .millisecondsSinceEpoch
                                          .remainder(10000000000)
                                          .toString();
                                      Walletapi _api = Walletapi();
                                      Map data = await _api.initTokenCashfree(
                                        amount:
                                            '${(rcvdData['total_amount'] * int.parse(monthname[0])) - int.parse(snapshot.data!.data[0].response!.walletBallance)}',
                                        orderId: orderId,
                                      );
                                      print(data);
                                      if (data['status'] == "OK") {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        cashFreeHalfpayment(
                                            monthamount:
                                                '${(rcvdData['total_amount'] * int.parse(monthname[0])) - int.parse(snapshot.data!.data[0].response!.walletBallance)}',
                                            token: data['cftoken'],
                                            orderId: orderId,
                                            name: 'santosh',
                                            email: 'email@email.com',
                                            is_wallet: '1',
                                            phone: '9798416091',
                                            amount: rcvdData['total_amount']
                                                .toString());
                                      } else {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: 'Something went wrong');
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(1,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      150,
                                                  child: Text(
                                                    "Add ₹ ${(rcvdData['total_amount'] * int.parse(monthname[0])) - int.parse(snapshot.data!.data[0].response!.walletBallance)} more to Wallet & Proceed",
                                                    style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      // fontFamily: font,
                                                      // fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                                Image.asset("assets/Vector.png")
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                            : InkWell(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  HomeApi _api = HomeApi();
                                  Map data = await _api.doPayment(
                                      amount:
                                          '${((rcvdData['total_amount']) * int.parse(monthname[0]))}',
                                      month: monthname,
                                      addressid: rcvdData['address_id'],
                                      subs: rcvdData['subs']);
                                  print(data);
                                  if (data['response'] == '1') {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pushNamed(context, '/thankyou',
                                        arguments: {'id': data['order-id']});
                                  } else {
                                    Fluttertoast.showToast(msg: data['msg']);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width - 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(
                                            1, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  150,
                                              child: Text(
                                                "Pay through wallet ₹ ${(rcvdData['total_amount']) * int.parse(monthname[0])}  & Proceed",
                                                style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  // fontFamily: font,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            Image.asset("assets/Vector.png")
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        snapshot.data!.data[0].response!.walletBallance ==
                                    '0' ||
                                snapshot.data!.data[0].response!
                                        .walletBallance ==
                                    0
                            ? Container()
                            : Text(
                                '( Available Wallet Balance : ₹${snapshot.data!.data[0].response!.walletBallance!} )'),
                        SizedBox(
                          height: 10,
                        ),
                        snapshot.data!.data[0].response!.walletBallance ==
                                    '0' ||
                                snapshot.data!.data[0].response!
                                        .walletBallance ==
                                    0
                            ? Container()
                            : Text(' Or ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            // print(
                            //     '${(rcvdData['total_amount']) * int.parse(monthname[0])}');
                            // return;
                            setState(() {
                              isLoading = true;
                            });
                            String orderId = DateTime.now()
                                .millisecondsSinceEpoch
                                .remainder(10000000000)
                                .toString();
                            Walletapi _api = Walletapi();
                            Map data = await _api.initTokenCashfree(
                              amount:
                                  '${(rcvdData['total_amount']) * int.parse(monthname[0])}',
                              orderId: orderId,
                            );
                            print(data);
                            if (data['status'] == "OK") {
                              setState(() {
                                isLoading = false;
                              });
                              cashFreeOnlinepayment(
                                  monthamount:
                                      '${(rcvdData['total_amount']) * int.parse(monthname[0])}',
                                  token: data['cftoken'],
                                  orderId: orderId,
                                  name: 'santosh',
                                  email: 'email@email.com',
                                  is_wallet: '1',
                                  phone: '9798416091',
                                  amount: rcvdData['total_amount'].toString());
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: 'Something went wrong');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      1, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                150,
                                        child: Text(
                                          "Pay Online ₹${(rcvdData['total_amount']) * int.parse(monthname[0])}",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            // fontFamily: font,
                                            // fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/Vector.png",
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
