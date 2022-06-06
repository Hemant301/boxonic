import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/api/walletapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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
        .then((value) => value?.forEach((key, value) {
              if (key == "txStatus" && value == "SUCCESS") {
                print('from succes');
                print(value);
                homeApi.doPaymentOnline(
                    amount: amount,
                    monthamount: monthamount,
                    subs: '1',
                    month: monthname,
                    addressid: addressId,
                    is_wallet: is_wallet,
                    paymentid: orderId);
                Navigator.pushReplacementNamed(
                  context,
                  '/thankyou',
                );
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
      "customerName": userCred.getUserName(),
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
                    subs: '1',
                    month: monthname,
                    addressid: addressId,
                  );

                  Navigator.pushReplacementNamed(
                    context,
                    '/thankyou',
                  );
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
          "Subscription",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              fontFamily: font,
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
          //         fontFamily: font,
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
              Text(
                "Monthly Subscription",
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 18,
                    color: grad2Color,
                    fontFamily: font,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                // height: 80,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 1),
                  color: Colors.white,
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
                  children: [
                    Container(
                      // padding: EdgeInsets.all(20),
                      height: 40,
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Monthly Subscribe Benefits Includes",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: font,
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 1)
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.4),
                          //     spreadRadius: 1,
                          //     blurRadius: 1,
                          //     offset: Offset(1, 3), // changes position of shadow
                          //   ),
                          // ],
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ">  Monthly Subscribe Benefits Includes",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: font,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            ">  Get 5% off on every shipment",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: font,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            ">  Free Shipping Always",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: font,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            ">  Surprise Benefits with every 3rd Shipment",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: font,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 24,
                                color: Colors.grey,
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "₹ ${rcvdData['total_amount']}",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                // height: 60,
                                // width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "₹ ${((rcvdData['total_amount']) - (rcvdData['total_amount']) * 5 / 100).toStringAsFixed(2)}",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                left: 100,
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
                                    " 5% Subscription discount ",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<CalAmountModal>(
                  stream: homebloc.getCalculatedAmount.stream,
                  builder: (context, snapshot) {
                    // print('++++++++++${snapshot.data!.data[0]}');
                    if (!snapshot.hasData) return Container();
                    return Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.all(20),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        "Add ₹ ${((rcvdData['total_amount']) - (rcvdData['total_amount']) * 5 / 100).toStringAsFixed(2)} x ",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  StreamBuilder<MonthsModal>(
                                      stream: homebloc.getLiveMonths.stream,
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData)
                                          return Container();
                                        return DropDown(
                                          items: List.generate(
                                              snapshot.data!.data.length,
                                              (index) => snapshot
                                                  .data!.data[index].months!),
                                          hint: Text("Select Months/Times"),
                                          icon: Icon(
                                            Icons.expand_more,
                                            color: Colors.blue,
                                          ),
                                          onChanged: (s) {
                                            monthname = s.toString();
                                            setState(() {});
                                          },
                                        );
                                      }),
                                  // Text(
                                  //   "Add ₹ 9785 x ",
                                  //   style: TextStyle(
                                  //       letterSpacing: 1,
                                  //       fontSize: 12,
                                  //       color: Colors.black,
                                  //       fontFamily: font,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset("assets/wallet (1) 3.png"),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "In Wallet",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                              'Total amount : ₹ ${(((rcvdData['total_amount']) - (rcvdData['total_amount']) * 5 / 100) * int.parse(monthname[0])).toStringAsFixed(2)}')
                        ],
                      ),
                    );
                  }),
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
                        double.parse((((rcvdData['total_amount']) -
                                            (rcvdData['total_amount']) *
                                                5 /
                                                100) *
                                        int.parse(monthname[0]))
                                    .toStringAsFixed(2)) >
                                int.parse(snapshot
                                    .data!.data[0].response!.walletBallance)
                            ? InkWell(
                                onTap: () async {
                                  String orderId = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .remainder(10000000000)
                                      .toString();
                                  Walletapi _api = Walletapi();
                                  Map data = await _api.initTokenCashfree(
                                    amount:
                                        '${double.parse((((rcvdData['total_amount']) - (rcvdData['total_amount']) * 5 / 100) * int.parse(monthname[0])).toStringAsFixed(2)) - int.parse(snapshot.data!.data[0].response!.walletBallance)}',
                                    orderId: orderId,
                                  );
                                  print(data);
                                  if (data['status'] == "OK") {
                                    cashFreeHalfpayment(
                                        monthamount:
                                            '${double.parse((((rcvdData['total_amount']) - (rcvdData['total_amount']) * 5 / 100) * int.parse(monthname[0])).toStringAsFixed(2)) - int.parse(snapshot.data!.data[0].response!.walletBallance)}',
                                        token: data['cftoken'],
                                        orderId: orderId,
                                        name: 'santosh',
                                        email: 'email@email.com',
                                        is_wallet: '1',
                                        phone: '9798416091',
                                        amount: rcvdData['total_amount']
                                            .toString());
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Something went wrong');
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
                                                "Add ₹ ${double.parse((((rcvdData['total_amount']) - (rcvdData['total_amount']) * 5 / 100) * int.parse(monthname[0])).toStringAsFixed(2)) - int.parse(snapshot.data!.data[0].response!.walletBallance)} more to Wallet & Proceed",
                                                style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontFamily: font,
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
                                  HomeApi _api = HomeApi();
                                  Map data = await _api.doPayment(
                                      amount:
                                          '${((rcvdData['total_amount']) * int.parse(monthname[0]))}',
                                      month: monthname,
                                      addressid: rcvdData['address_id'],
                                      subs: rcvdData['subs']);
                                  print(data);
                                  if (data['response'] == '1') {
                                    Navigator.pushNamed(
                                      context,
                                      '/thankyou',
                                    );
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
                                                  fontFamily: font,
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
                        Text(
                            '( Available Wallet Balance : ₹${snapshot.data!.data[0].response!.walletBallance!} )'),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(' Or ',
                        //     style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        // InkWell(
                        //   onTap: () async {
                        //     // print(
                        //     //     '${(rcvdData['total_amount']) * int.parse(monthname[0])}');
                        //     // return;
                        //     String orderId = DateTime.now()
                        //         .millisecondsSinceEpoch
                        //         .remainder(10000000000)
                        //         .toString();
                        //     Walletapi _api = Walletapi();
                        //     Map data = await _api.initTokenCashfree(
                        //       amount:
                        //           '${(rcvdData['total_amount']) * int.parse(monthname[0])}',
                        //       orderId: orderId,
                        //     );
                        //     print(data);
                        //     if (data['status'] == "OK") {
                        //       cashFreeOnlinepayment(
                        //           monthamount:
                        //               '${(rcvdData['total_amount']) * int.parse(monthname[0])}',
                        //           token: data['cftoken'],
                        //           orderId: orderId,
                        //           name: 'santosh',
                        //           email: 'email@email.com',
                        //           is_wallet: '1',
                        //           phone: '9798416091',
                        //           amount: rcvdData['total_amount'].toString());
                        //     } else {
                        //       Fluttertoast.showToast(
                        //           msg: 'Something went wrong');
                        //     }
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.all(10),
                        //     width: MediaQuery.of(context).size.width - 40,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: Colors.amber,
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.grey.withOpacity(0.4),
                        //           spreadRadius: 1,
                        //           blurRadius: 1,
                        //           offset: Offset(
                        //               1, 3), // changes position of shadow
                        //         ),
                        //       ],
                        //     ),
                        //     child: Column(
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Row(
                        //             children: [
                        //               Container(
                        //                 width:
                        //                     MediaQuery.of(context).size.width -
                        //                         150,
                        //                 child: Text(
                        //                   "Pay Online ₹${(rcvdData['total_amount']) * int.parse(monthname[0])}",
                        //                   style: TextStyle(
                        //                     letterSpacing: 1,
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 12,
                        //                     color: Color.fromARGB(255, 0, 0, 0),
                        //                     fontFamily: font,
                        //                     // fontWeight: FontWeight.bold
                        //                   ),
                        //                 ),
                        //               ),
                        //               Image.asset(
                        //                 "assets/Vector.png",
                        //                 color: Colors.black,
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                "Bundle amount will be auto debited on shipment date every month from your wallet.",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 15,
                  color: Colors.grey[600],
                  fontFamily: font,
                  // fontWeight: FontWeight.bold
                ),
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
