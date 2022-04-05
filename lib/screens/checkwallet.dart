import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Checkwallet extends StatelessWidget {
  const Checkwallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;

    print(rcvdData['total_amount']);
    homebloc.fetchWalletbalance();
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
        body: Center(
          child: StreamBuilder<WalletModal>(
              stream: homebloc.getwallet.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Wallet Balance",
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          // print('object');
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
                      ),
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
                                amount: rcvdData['total_amount'].toString());
                            print(data);
                            if (data['response'] == '1') {
                              Navigator.pushNamed(
                                context,
                                '/thankyou',
                              );
                            } else {}
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
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: lightWhite2,
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
                              "Confirm Order",
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
                        height: 30,
                      )
                    ]);
              }),
        ));
  }
}
