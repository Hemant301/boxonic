import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/api/walletapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Checkwallet extends StatefulWidget {
  const Checkwallet({Key? key}) : super(key: key);

  @override
  State<Checkwallet> createState() => _CheckwalletState();
}

class _CheckwalletState extends State<Checkwallet> {
  TextEditingController amountController = TextEditingController();

  void cashFree(
      {String amount = "",
      String token = "",
      String orderId = "",
      String name = "",
      String phone = "",
      String email = ""}) {
    Map<String, dynamic> inputParams = {
      "orderId": '$orderId',
      "orderAmount": '$amount',
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
                walletApi.doSuccessPayment(amount: amount, txnid: orderId);

                setState(() {
                  homebloc.fetchWalletbalance();
                  homebloc.fetchWalletTransaction();

                  amountController.text = "";
                });
                Fluttertoast.showToast(
                    msg: 'Succesfully Added', backgroundColor: Colors.green);
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

  void cashFreeOnlinepayment(
      {String amount = "",
      String token = "",
      String orderId = "",
      String name = "",
      String phone = "",
      String email = ""}) {
    Map<String, dynamic> inputParams = {
      "orderId": '$orderId',
      "orderAmount": '$amount',
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
                    amount: totalamount,
                    subs: subs,
                    month: months,
                    addressid: addressId,
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

  late Razorpay _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  String amount = "";

  void openCheckout(totalamount) async {
    amount = totalamount.toString();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': (totalamount) * 100,
      'name': 'Boxoniq',
      'description': 'Add Wallet Money',
      'prefill': {'contact': '9798416091', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    String trnid = response.paymentId!;
    walletApi.doSuccessPayment(amount: amount, txnid: trnid);
    setState(() {
      homebloc.fetchWalletbalance();

      amountController.text = "";
    });
    // String trnid = response.paymentId!;
    // String userid = userCred.getUserId();
    // walletbloc.fetchwallettrans(userid);
    // walletApi.doAddwalletmoney(userid, amount, trnid, couponid, iscoupon);

    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId! + "Rs" + amount,
    //     toastLength: Toast.LENGTH_SHORT);
    // Navigator.pushReplacementNamed(
    //   context, '/money_added',
    //   // arguments: {'amount': amount}
    // );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  String totalamount = '0';
  String addressId = '0';
  String months = '0';
  String subs = '0';
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;

    print(rcvdData['total_amount']);
    print(rcvdData['address_id']);
    print(rcvdData['month']);
    print(rcvdData['subs']);
    totalamount = rcvdData['total_amount'].toString();
    addressId = rcvdData['address_id'];
    months = rcvdData['month'];
    subs = rcvdData['subs'];
    homebloc.fetchWalletbalance();
    homebloc.fetchuserDetails();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Wallet",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder<WalletModal>(
            stream: homebloc.getwallet.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Available Wallet Balance",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // padding: EdgeInsets.all(20),
                          height: 80,
                          width: MediaQuery.of(context).size.width - 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
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
                          child: Center(
                            child: Text(
                              "₹ ${snapshot.data!.balance[0].amount}",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Text(
                        //   "Enter amount to add ",
                        //   style: TextStyle(
                        //       letterSpacing: 1,
                        //       fontSize: 16,
                        //       color: Colors.black,
                        //       fontFamily: font,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      1, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Enter Amount '),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<UserdetailModal>(
                            stream: homebloc.getuserdetails.stream,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return Container();
                              return InkWell(
                                onTap: () async {
                                  // print('object');
                                  if (amountController.text == "") {
                                    Fluttertoast.showToast(msg: 'Enter Amount');
                                    return;
                                  }
                                  String orderId = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .remainder(10000000000)
                                      .toString();
                                  Walletapi _api = Walletapi();
                                  Map data = await _api.initTokenCashfree(
                                    amount: amountController.text,
                                    orderId: orderId,
                                  );
                                  print(data);
                                  if (data['status'] == "OK") {
                                    cashFree(
                                      amount: amountController.text,
                                      token: data['cftoken'],
                                      orderId: orderId,
                                      name: snapshot.data!.name!,
                                      email: snapshot.data!.email!,
                                      phone: snapshot.data!.phone!,
                                    );
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Something went wrong');
                                  }
                                  // openCheckout(int.parse(amountController.text));
                                },
                                child: Container(
                                  // padding: EdgeInsets.all(20),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width - 10,
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
                                  child: Center(
                                    child: Text(
                                      "+ Add To Wallet",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        Spacer(
                          flex: 1,
                        ),
                        InkWell(
                          onTap: () async {
                            if (int.parse(snapshot.data!.balance[0].amount!) >
                                rcvdData['total_amount']) {
                              print('paise h bhai');
                              HomeApi _api = HomeApi();
                              Map data = await _api.doPayment(
                                  amount: rcvdData['total_amount'].toString(),
                                  month: rcvdData['month'],
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
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Add amount to wallet',
                                  backgroundColor: Colors.red);
                              return;
                            }
                            // print('object');
                          },
                          child: Container(
                            // padding: EdgeInsets.all(20),
                            height: 40,
                            width: MediaQuery.of(context).size.width - 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: lightWhite2,
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
                            child: Center(
                              child: Text(
                                "Pay through wallet",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: font,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<UserdetailModal>(
                            stream: homebloc.getuserdetails.stream,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return Container();
                              return InkWell(
                                onTap: () async {
                                  String orderId = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .remainder(10000000000)
                                      .toString();
                                  Walletapi _api = Walletapi();
                                  Map data = await _api.initTokenCashfree(
                                    amount: rcvdData['total_amount'].toString(),
                                    orderId: orderId,
                                  );
                                  print(data);
                                  if (data['status'] == "OK") {
                                    cashFreeOnlinepayment(
                                      amount:
                                          rcvdData['total_amount'].toString(),
                                      token: data['cftoken'],
                                      orderId: orderId,
                                      name: snapshot.data!.name!,
                                      email: snapshot.data!.email!,
                                      phone: snapshot.data!.phone!,
                                    );
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Something went wrong');
                                  }
                                  // openCheckout(int.parse(amountController.text));
                                },
                                child: Container(
                                  // padding: EdgeInsets.all(20),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width - 10,
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
                                  child: Center(
                                    child: Text(
                                      "Pay Online",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        SizedBox(
                          height: 30,
                        )
                      ]),
                ),
              );
            }));
  }
}
