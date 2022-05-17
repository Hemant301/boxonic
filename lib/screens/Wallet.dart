import 'package:boxoniq/api/walletapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class WallatePage extends StatefulWidget {
  const WallatePage({Key? key}) : super(key: key);

  @override
  State<WallatePage> createState() => _WallatePageState();
}

class _WallatePageState extends State<WallatePage> {
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
              print("$key : $value");
              if (key == "txStatus" && value == "SUCCESS") {
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
                print('from  fail==========');
                Fluttertoast.showToast(
                    msg: 'Fail', backgroundColor: Colors.red);
              }

              //Do something with the result
            }));
  }

  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    // _razorpay.clear();
  }

  String amount = "";


  int sum = 0;

  @override
  Widget build(BuildContext context) {
// Generate a v1 (time-based) id
    homebloc.fetchuserDetails();
    homebloc.fetchWalletbalance();
    homebloc.fetchWalletTransaction();

    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        // leading: Container(),
        // leadingWidth: 0,
        // leading: Container(),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),

        title: InkWell(
          onTap: () {
            setState(() {
              sum + 45;
            });
            print(sum);
          },
          child: Text(
            "Boxoniq Wallet",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      int newValue = 50 - 5;
                      sum = newValue;
                    });
                    print(sum);
                  },
                  child: Text(
                    "Wallet Balance",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<WalletModal>(
                    stream: homebloc.getwallet.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Container(
                        // padding: EdgeInsets.all(20),
                        height: 80,
                        width: MediaQuery.of(context).size.width - 40,
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
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: InputDecoration(
                        border: InputBorder.none, labelText: 'Enter Amount'),
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
                            Fluttertoast.showToast(msg: 'Something went wrong');
                          }
                          // openCheckout(int.parse(amountController.text));
                        },
                        child: Container(
                          // padding: EdgeInsets.all(20),
                          height: 40,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Transactions",
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
                StreamBuilder<WallettransModal>(
                    stream: homebloc.getwallettrans.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Container(
                          // padding: EdgeInsets.all(20),

                          width: MediaQuery.of(context).size.width - 40,
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
                          child: Column(
                            children: List.generate(
                                snapshot.data!.wallethistory.length,
                                (index) => Container(
                                      // padding: EdgeInsets.symmetric(horizontal: 10),
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        boxShadow: [
                                          // BoxShadow(
                                          //   color: Colors.grey.withOpacity(0.4),
                                          //   spreadRadius: 1,
                                          //   blurRadius: 1,
                                          //   offset: Offset(
                                          //       1, 3), // changes position of shadow
                                          // ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width /
                                                                  2 +
                                                              10,
                                                      child: Text(
                                                        snapshot
                                                            .data!
                                                            .wallethistory[
                                                                index]
                                                            .msg!,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          letterSpacing: 1,
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                          fontFamily: font,
                                                          // fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data!
                                                          .wallethistory[index]
                                                          .created_on!,
                                                      style: TextStyle(
                                                        letterSpacing: 1,
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontFamily: font,
                                                        // fontWeight: FontWeight.bold
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  '₹ ${snapshot.data!.wallethistory[index].amount!}',
                                                  style: TextStyle(
                                                      color: snapshot
                                                                  .data!
                                                                  .wallethistory[
                                                                      index]
                                                                  .type ==
                                                              1
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                )

                                                // CircleAvatar(
                                                //   radius: 25,
                                                //   // backgroundImage: AssetImage(
                                                //   //     "assets/wallet (1) 3.png"),
                                                //   backgroundColor:
                                                //       Colors.transparent,
                                                //   child: Padding(
                                                //     padding:
                                                //         const EdgeInsets.all(
                                                //             12.0),
                                                //     child: Image.asset(
                                                //       "assets/wallet (1) 3.png",
                                                //       fit: BoxFit.cover,
                                                //       height: 40,
                                                //       width: 40,
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                          Divider(
                                            height: 1,
                                            color:
                                                Color.fromARGB(255, 99, 99, 99),
                                          )
                                        ],
                                      ),
                                    )),
                          ));
                    })
              ]),
        ),
      ),
    );
  }
}
