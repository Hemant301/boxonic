import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class MyBundalSubscription extends StatelessWidget {
  const MyBundalSubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    String id = rcvdData['id'];
    homebloc.fetchSubsdetails(id);
    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        // title: Text(
        //   "Billing",
        //   style: TextStyle(
        //       letterSpacing: 1,
        //       fontSize: 18,
        //       color: grad2Color,
        //       fontFamily: font,
        //       fontWeight: FontWeight.bold),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 100,
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                // border: Border.all(color: Colors.blue, width: 1),
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
                  "+ Add Items",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      color: grad2Color,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Myordermodal>(
            stream: homebloc.getSubsdetail.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "My Bundle Subscription",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Preview Seclected items, edit",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff303754),
                        // border: Border.all(color: Colors.blue, width: 1),
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
                          Text(
                            "Your next box is ready to ship on 25th jan. Please maintain sufficiant balance in your wallet for your upcoming shipment",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 120,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              // border: Border.all(color: Colors.blue, width: 1),
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
                                "Manage Wallet",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 12,
                                    color: grad2Color,
                                    fontFamily: font,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   "Category 1",
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
                    Column(
                      children: List.generate(
                        snapshot.data!.items.length,
                        (index) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                // border: Border.all(color: Colors.blue, width: 1),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                          height: 120,
                                          width: 100,
                                          child: Image.network(
                                            snapshot.data!.items[index].img!,
                                          ))
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data!.items[index].item_name!,
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              'Quantity : ${snapshot.data!.items[index].quantity}'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              'Price : ₹ ${snapshot.data!.items[index].item_price}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          'Total : ₹ ${snapshot.data!.items[index].amount}'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              HomeApi _api = HomeApi();
                                              Map data = await _api
                                                  .deletesubsItem(snapshot.data!
                                                      .items[index].cart_id!);
                                                      
                                            },
                                            child: Container(
                                              width: 120,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color(0xff53900F),
                                                // border: Border.all(color: Colors.blue, width: 1),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Remove Item",
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontFamily: font,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 48,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          // border: Border.all(color: Colors.blue, width: 1),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "₹ ${snapshot.data!.total!.subtotal}",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     // crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "Bundle Discount",
                            //         style: TextStyle(
                            //             letterSpacing: 1,
                            //             fontSize: 16,
                            //             color: Colors.grey[600],
                            //             fontFamily: font,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       SizedBox(
                            //         height: 5,
                            //       ),
                            //       Text(
                            //         "-₹ 1,200",
                            //         style: TextStyle(
                            //             letterSpacing: 1,
                            //             fontSize: 16,
                            //             color: Colors.black,
                            //             fontFamily: font,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Coupon Discount",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "- ₹ ${snapshot.data!.total!.discount}",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "₹ ${snapshot.data!.total!.total}",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          // border: Border.all(color: Colors.blue, width: 1),
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
                              "₹ ${snapshot.data!.total!.subtotal}",
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
                                      "₹ ${snapshot.data!.total!.total}",
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
                                  left: 90,
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
                                          offset: Offset(1,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "${snapshot.data!.total!.discount}% off ",
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/billing");
                      },
                      child: Center(
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                            // border: Border.all(color: Colors.blue, width: 1),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Update Subscription",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: font,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Image.asset("assets/Vector.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/billing");
                          },
                          child: Center(
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey,
                                // border: Border.all(color: Colors.blue, width: 1),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Skip for This Month",
                                    style: TextStyle(
                                        // letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
                                  // Image.asset(
                                  //   "assets/Vector.png",
                                  //   width: 10,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, "/billing");
                          },
                          child: Center(
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2 - 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                                // border: Border.all(color: Colors.blue, width: 1),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Cancel Subscription",
                                    style: TextStyle(
                                        // letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: font,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  // ),
                                  // Image.asset("assets/Vector.png"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
