import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  String monthname = '';
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    // print(rcvdData['activeIndex']);
    // print(rcvdData['activeIndex'].runtimeType);
    print(rcvdData['total_amount']);
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
              Text(
                "Select Months & Preview Wallet. You can cancel or pause you subscription anytime!",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 15,
                  color: Colors.grey[600],
                  fontFamily: font,
                  // fontWeight: FontWeight.bold
                ),
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
                            "₹ ${snapshot.data!.data[0].response!.sub_total}",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 16,
                                color: Colors.black,
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
                                    "₹ ${snapshot.data!.data[0].response!.total}",
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
                                top: 0,
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
                                    "₹ ${snapshot.data!.data[0].response!.coupon_discount} off ",
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
                                children: [
                                  Text(
                                    "Add ₹ ${snapshot.data!.data[0].response!.total} x ",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
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
                                          hint: Text("Select Months"),
                                          icon: Icon(
                                            Icons.expand_more,
                                            color: Colors.blue,
                                          ),
                                          onChanged: (s) {
                                            monthname = s.toString();
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
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (monthname == "") {
                    Fluttertoast.showToast(msg: 'Select Month');
                    return;
                  }
                  Navigator.pushNamed(context, "/checkwallet",
                      arguments: {'total_amount': rcvdData['total_amount']});
                  // Navigator.pushNamed(context, "/mybundalSubscription");
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
                        offset: Offset(1, 3), // changes position of shadow
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
                              width: MediaQuery.of(context).size.width - 150,
                              child: Text(
                                "Add to Wallet & Proceed",
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
                height: 20,
              ),
              Text(
                "Bundle amount will be auto debited on 7th of every month from your wallet.",
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
