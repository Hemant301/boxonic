import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class Myorderdetail extends StatelessWidget {
  const Myorderdetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    String id = rcvdData['id'];
    homebloc.fetchOrderdetails(id);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: CircleAvatar(
          //       backgroundImage: NetworkImage(
          //         "https://cdn-icons-png.flaticon.com/128/1177/1177568.png",
          //       ),
          //     ),
          //   ),
          // ],
          title: Text(
            'Order detail',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: StreamBuilder<Myorderdetailmodal>(
            stream: homebloc.getOrderdetails.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return Column(
                children: [
                  SizedBox(
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
                                          snapshot.data!.items[index].img!),
                                    )
                                  ],
                                ),
                                SizedBox(
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
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontFamily: font,
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
                                    //       fontFamily: font,
                                    //       // fontWeight: FontWeight.bold
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
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
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Price : ₹ ${snapshot.data!.items[index].item_price.toString()}',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Total : ₹ ${snapshot.data!.items[index].amount}',
                                      style: TextStyle(
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
                  SizedBox(
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
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "-₹ ${snapshot.data!.total!.discount}",
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
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     // crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Coupon Discount",
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
                          //         "-₹ ${snapshot.data!.total!.subtotal}",
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              );
            }),
      ),
    );
  }
}
