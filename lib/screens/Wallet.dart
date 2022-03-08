import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class WallatePage extends StatelessWidget {
  const WallatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        // leading: Container(),
        title: Text(
          "    Boxoniq Wallet",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              fontFamily: font,
              fontWeight: FontWeight.bold),
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
                        offset: Offset(1, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "₹ 12,520",
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
                Container(
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
                        offset: Offset(1, 3), // changes position of shadow
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
                Container(
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
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: List.generate(
                          5,
                          (index) => Container(
                                // padding: EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width - 40,
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Paid For Bundle ID #BXNQ1257",
                                                style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: font,
                                                  // fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "22th Jan, 2022| 05:52 PM",
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
                                          CircleAvatar(
                                            radius: 25,
                                            // backgroundImage: AssetImage(
                                            //     "assets/wallet (1) 3.png"),
                                            backgroundColor: Colors.transparent,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Image.asset(
                                                "assets/wallet (1) 3.png",
                                                fit: BoxFit.cover,
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Divider(
                                      height: 1,
                                      color: Color.fromARGB(255, 99, 99, 99),
                                    )
                                  ],
                                ),
                              )),
                    ))
              ]),
        ),
      ),
    );
  }
}
