import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/screens/mysublist.dart';
import 'package:boxoniq/shimmer/newshimmer.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Mysubsrdetail extends StatefulWidget {
  const Mysubsrdetail({Key? key}) : super(key: key);

  @override
  State<Mysubsrdetail> createState() => _MysubsrdetailState();
}

class _MysubsrdetailState extends State<Mysubsrdetail> {
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    String id = rcvdData['id'];
    homebloc.fetchsubsdetails(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Subscription detail',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<Myorderdetailmodal>(
            stream: homebloc.getSubsdetailss.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Shimmer_home();
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
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
                                  offset: const Offset(
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
                                          snapshot.data!.items[index].img!),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        snapshot.data!.items[index].item_name!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            // fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 5,
                                    // ),
                                    // SizedBox(
                                    //   width: MediaQuery.of(context).size.width -
                                    //       180,
                                    //   child: Text(
                                    //     "Contains 14 essential vitamins and minerals. Vegan, USDA certified organic, and nonGMO.",
                                    //     style: TextStyle(
                                    //       letterSpacing: 1,
                                    //       fontSize: 10,
                                    //       color: Colors.black,
                                    //       // fontFamily: font,
                                    //       // fontWeight: FontWeight.bold
                                    //     ),
                                    //   ),
                                    // ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Quantity : ${snapshot.data!.items[index].quantity}',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Price : ??? ${snapshot.data!.items[index].item_price.toString()}',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Total : ??? ${snapshot.data!.items[index].amount}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
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
                            offset: Offset(1, 3), // changes position of shadow
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "??? ${snapshot.data!.total!.subtotal}",
                                  style: const TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.black,
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Coupon Discount",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "- ??? ${snapshot.data!.total!.coupon}",
                                  style: const TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.black,
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bundle Discount",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "-??? ${snapshot.data!.total!.bundledissount}",
                                  style: const TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.black,
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Subscription Discount",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "-??? ${snapshot.data!.total!.subsdissount}",
                                  style: const TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.black,
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     // crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Coupon Discount",
                          //         style: TextStyle(
                          //             letterSpacing: 1,
                          //             fontSize: 16,
                          //             color: Colors.grey[600],
                          //             // fontFamily: font,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(
                          //         height: 5,
                          //       ),
                          //       Text(
                          //         "-??? ${snapshot.data!.total!.subtotal}",
                          //         style: TextStyle(
                          //             letterSpacing: 1,
                          //             fontSize: 16,
                          //             color: Colors.black,
                          //             // fontFamily: font,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "??? ${snapshot.data!.total!.total}",
                                  style: const TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.black,
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 45,
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
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Delivery Address',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data!.address!.name!,
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80,
                                    child: Text(
                                      'Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      snapshot.data!.address!.address!,
                                      style: TextStyle(),
                                    ),
                                  ),
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
                                      'LandMark',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data!.address!.landmark!,
                                    style: TextStyle(),
                                  ),
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
                                      'State',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data!.address!.state!,
                                    style: TextStyle(),
                                  ),
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
                                      'Pincode',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data!.address!.pincode!,
                                    style: TextStyle(),
                                  ),
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
                                      'Phone',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    snapshot.data!.address!.phone!,
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  snapshot.data!.total!.status == "5"
                      ? Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 15, 7),
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
                                "Cancelled",
                                style: TextStyle(
                                    // letterSpacing: 1,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    // fontFamily: font,
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
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            int.parse(snapshot.data!.total!.status!) < 3
                                ? InkWell(
                                    onTap: () async {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Are Your Sure?"),
                                              content: Text(
                                                  'Are you sure to cancel this order?'),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text("No",
                                                      style: TextStyle(
                                                          color: Colors.blue)),
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, false),
                                                ),
                                                FlatButton(
                                                    onPressed: () async {
                                                      HomeApi api = HomeApi();
                                                      Map data = await api
                                                          .cancelMySubsorder(
                                                              id);
                                                      if (data['response'] ==
                                                          "1") {
                                                        setState(() {
                                                          homebloc
                                                              .fetchsubsdetails(
                                                                  id);
                                                        });
                                                        Navigator.pop(context);
                                                        Fluttertoast.showToast(
                                                            msg: data['msg']);
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg: data['msg']);
                                                      }
                                                    },
                                                    child: Text("Sure",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blue))),
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          40,
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
                                            offset: Offset(1,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Cancel Order",
                                            style: TextStyle(
                                                // letterSpacing: 1,
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                // fontFamily: font,
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
                                  )
                                : InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/webview',
                                          arguments: {
                                            'title': 'Track order',
                                            'url':
                                                'https://pickrr.com/tracking/#/?tracking_id=${snapshot.data!.tackingid}'
                                          });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          40,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.amber,
                                        // border: Border.all(color: Colors.blue, width: 1),
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Track Order",
                                            style: TextStyle(
                                                // letterSpacing: 1,
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                // fontFamily: font,
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
                            int.parse(snapshot.data!.total!.status!) < 3
                                ? InkWell(
                                    onTap: () {
                                      return;
                                      Navigator.pushNamed(context, '/webview',
                                          arguments: {
                                            'title': 'Invoice',
                                            'url':
                                                'https://cms.cybertizeweb.com/boxoniq-crm/billing-subscription/?id=${rcvdData['id']}'
                                          });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          40,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            Color.fromARGB(255, 128, 176, 130),
                                        // border: Border.all(color: Colors.blue, width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(1,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Invoice",
                                            style: TextStyle(
                                                // letterSpacing: 1,
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                // fontFamily: font,
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
                                  )
                                : InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/webview',
                                          arguments: {
                                            'title': 'Invoice',
                                            'url':
                                                'https://cms.cybertizeweb.com/boxoniq-crm/billing-subscription/?id=${rcvdData['id']}'
                                          });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          40,
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
                                            offset: const Offset(1,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Invoice",
                                            style: TextStyle(
                                                // letterSpacing: 1,
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                // fontFamily: font,
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
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            }),
      ),
    );
  }
}
