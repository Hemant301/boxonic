import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../shimmer/newshimmer.dart';

class MyBundalSubscription extends StatefulWidget {
  const MyBundalSubscription({Key? key}) : super(key: key);

  @override
  State<MyBundalSubscription> createState() => _MyBundalSubscriptionState();
}

class _MyBundalSubscriptionState extends State<MyBundalSubscription> {
  int isCancelled = 0;
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['id']);
    String id = rcvdData['id'];
    homebloc.fetchSubsdetails(id);
    homebloc.fetchWalletbalance();

    homebloc.fetchSubsBenefit();
    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: const Text(
          "Subscription",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              // fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          StreamBuilder<MySubdetailmodal>(
              stream: homebloc.getSubsdetail.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      if (isCancelled == 1) {
                        Fluttertoast.showToast(
                            msg: 'Subscription is already cancelled');
                        return;
                      }
                      Navigator.pushNamed(context, '/addtobundle', arguments: {
                        'id': '1',
                        'index': '1',
                        'process': rcvdData['id']
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
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
                              // fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<MySubdetailmodal>(
            stream: homebloc.getSubsdetail.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Shimmer_home();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "My Bundle Subscription",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 20,
                              color: Colors.black,
                              // fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        StreamBuilder<SubsbenefitsModal>(
                            stream: homebloc.getSubsBenifits.stream,
                            builder: (context, newsnapshot) {
                              if (!snapshot.hasData) return Container();
                              return InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierLabel: "Barrier",
                                      barrierDismissible: true,
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      // transitionDuration:
                                      //     Duration(milliseconds: 500),
                                      builder: (_) {
                                        return Center(
                                          child: Container(
                                            height: 350,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              // height: 80,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.blue,
                                                    width: 1),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: Offset(1,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    // padding: EdgeInsets.all(20),
                                                    height: 40,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            80,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.green,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.4),
                                                          spreadRadius: 1,
                                                          blurRadius: 1,
                                                          offset: Offset(1,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Monthly Subscription Benefits Includes",
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.blue,
                                                            width: 1)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                        newsnapshot
                                                            .data!.data.length,
                                                        (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Text(
                                                            newsnapshot
                                                                .data!
                                                                .data[index]
                                                                .name!,
                                                            style: TextStyle(
                                                              letterSpacing: 1,
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily: font,
                                                              // fontWeight: FontWeight.bold
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(Icons.info, size: 18));
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Modify, Skip or Cancel your subscription from here anytime",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Text(
                      'Product delivered for ${snapshot.data!.delivered} Months',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
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
                            snapshot.data!.nextdate!,
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: Colors.white,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/Wallet');
                                },
                                child: Container(
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
                                  child: const Center(
                                    child: Text(
                                      "Manage Wallet",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          color: grad2Color,
                                          // fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              StreamBuilder<WalletModal>(
                                  stream: homebloc.getwallet.stream,
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) return Container();
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/Wallet');
                                      },
                                      child: Container(
                                        // width: 120,
                                        // padding: EdgeInsets.all(5),
                                        // decoration: BoxDecoration(
                                        //   borderRadius:
                                        //       BorderRadius.circular(5),
                                        //   color: Colors.white,
                                        //   // border: Border.all(color: Colors.blue, width: 1),
                                        //   boxShadow: [
                                        //     BoxShadow(
                                        //       color:
                                        //           Colors.grey.withOpacity(0.4),
                                        //       spreadRadius: 1,
                                        //       blurRadius: 1,
                                        //       offset: Offset(1,
                                        //           3), // changes position of shadow
                                        //     ),
                                        //   ],
                                        // ),
                                        child: Center(
                                          child: Text(
                                            "Available Balance : ???${snapshot.data!.balance[0].amount}",
                                            style: TextStyle(
                                                letterSpacing: 1,
                                                fontSize: 13,
                                                color: Colors.white,
                                                // fontFamily: font,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ],
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
                    //       // fontFamily: font,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(
                          snapshot.data!.order.length,
                          (i) => Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data!.order[i].title!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  Column(
                                    children: List.generate(
                                      snapshot.data!.order[i].items.length,
                                      (index) => Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    40,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  // border: Border.all(color: Colors.blue, width: 1),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.4),
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                      offset: Offset(1,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                            height: 120,
                                                            width: 100,
                                                            child:
                                                                Image.network(
                                                              snapshot
                                                                  .data!
                                                                  .order[i]
                                                                  .items[index]
                                                                  .img!,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .order[i]
                                                              .items[index]
                                                              .item_name!,
                                                          style: TextStyle(
                                                              letterSpacing: 1,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                              // fontFamily: font,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black)),
                                                              child: Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      if (isCancelled ==
                                                                          1) {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                'Subscription is already cancelled');
                                                                        return;
                                                                      }
                                                                      HomeApi
                                                                          _api =
                                                                          HomeApi();
                                                                      Map data = await _api.updateQuantity(
                                                                          process: rcvdData[
                                                                              'id'],
                                                                          attr_price: snapshot
                                                                              .data!
                                                                              .order[
                                                                                  i]
                                                                              .items[
                                                                                  index]
                                                                              .attr_price,
                                                                          cartid: snapshot
                                                                              .data!
                                                                              .order[i]
                                                                              .items[index]
                                                                              .cart_id!,
                                                                          qty: (int.parse(snapshot.data!.order[i].items[index].quantity!) - 1).toString());
                                                                      if (data[
                                                                              'response'] ==
                                                                          '1') {
                                                                        setState(
                                                                            () {});
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                'Successfully updated');
                                                                      } else {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                'Something went wrong');
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              1),
                                                                      decoration: const BoxDecoration(
                                                                          // shape: BoxShape.circle,
                                                                          // border: Border.all(
                                                                          //     color: Colors.black)
                                                                          ),
                                                                      child: const Icon(
                                                                          Icons
                                                                              .arrow_drop_down_outlined),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(2),
                                                                    decoration: BoxDecoration(
                                                                        // shape: BoxShape.circle,
                                                                        // border: Border.all(
                                                                        //     color: Colors.black)
                                                                        ),
                                                                    child: Text(
                                                                        '${snapshot.data!.order[i].items[index].quantity}'),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      if (isCancelled ==
                                                                          1) {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                'Subscription is already cancelled');
                                                                        return;
                                                                      }
                                                                      HomeApi
                                                                          _api =
                                                                          HomeApi();
                                                                      Map data = await _api.updateQuantity(
                                                                          process: rcvdData[
                                                                              'id'],
                                                                          attr_price: snapshot
                                                                              .data!
                                                                              .order[
                                                                                  i]
                                                                              .items[
                                                                                  index]
                                                                              .attr_price,
                                                                          cartid: snapshot
                                                                              .data!
                                                                              .order[i]
                                                                              .items[index]
                                                                              .cart_id!,
                                                                          qty: (int.parse(snapshot.data!.order[i].items[index].quantity!) + 1).toString());
                                                                      if (data[
                                                                              'response'] ==
                                                                          '1') {
                                                                        setState(
                                                                            () {});
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                'Successfully updated');
                                                                      } else {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                'Something went wrong');
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              1),
                                                                      decoration: BoxDecoration(
                                                                          // shape: BoxShape.circle,
                                                                          // border: Border.all(
                                                                          //     color: Colors.black)
                                                                          ),
                                                                      child: Icon(
                                                                          Icons
                                                                              .arrow_drop_up_outlined),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            // Text(
                                                            //     'Quantity : ${snapshot.data!.items[index].quantity}'),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Price : ??? ${snapshot.data!.order[i].items[index].attr_price}')
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                                'Total : ??? ${snapshot.data!.order[i].items[index].amount}'),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Attr : ${snapshot.data!.order[i].items[index].item_attr}'),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              children:
                                                                  List.generate(
                                                                      snapshot
                                                                          .data!
                                                                          .order[
                                                                              i]
                                                                          .items[
                                                                              index]
                                                                          .attribute
                                                                          .length,
                                                                      (n) =>
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(3.0),
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                if (snapshot.data!.cancel == 1) {
                                                                                  Fluttertoast.showToast(msg: 'Subscription is already cancelled');
                                                                                  return;
                                                                                }
                                                                                HomeApi _api = HomeApi();
                                                                                Map data = await _api.updateAttr(attrprice: snapshot.data!.order[i].items[index].attribute[n].price, processid: rcvdData['id'], qty: snapshot.data!.order[i].items[index].quantity!, cartid: snapshot.data!.order[i].items[index].cart_id!, item_id: snapshot.data!.order[i].items[index].item_id!, attrid: snapshot.data!.order[i].items[index].attribute[n].attr_id!.toString());
                                                                                if (data['response'] == '1') {
                                                                                  setState(() {});
                                                                                  Fluttertoast.showToast(msg: 'Successfully updated');
                                                                                } else {
                                                                                  Fluttertoast.showToast(msg: 'Something went wrong');
                                                                                }
                                                                              },
                                                                              child: Chip(
                                                                                  padding: const EdgeInsets.all(1),
                                                                                  backgroundColor: snapshot.data!.order[i].items[index].item_attr == snapshot.data!.order[i].items[index].attribute[n].attr_name! ? Colors.amber : Colors.grey[300],
                                                                                  label: Text(
                                                                                    snapshot.data!.order[i].items[index].attribute[n].attr_name!,
                                                                                    style: const TextStyle(fontSize: 10),
                                                                                  )),
                                                                            ),
                                                                          )),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                if (isCancelled ==
                                                                    1) {
                                                                  Fluttertoast
                                                                      .showToast(
                                                                          msg:
                                                                              'Subscription is already cancelled');
                                                                  return;
                                                                }
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            "Are Your Sure?"),
                                                                        content:
                                                                            const Text('Are you sure to delete this item from cart?'),
                                                                        actions: <
                                                                            Widget>[
                                                                          FlatButton(
                                                                            child:
                                                                                Text("No", style: TextStyle(color: Colors.blue)),
                                                                            onPressed: () =>
                                                                                Navigator.pop(context, false),
                                                                          ),
                                                                          FlatButton(
                                                                              onPressed: () async {
                                                                                HomeApi _api = HomeApi();
                                                                                List data = await _api.deletesubsItem(snapshot.data!.order[i].items[index].cart_id!, rcvdData['id']);
                                                                                if (data[0]['response'] == true) {
                                                                                  setState(() {});
                                                                                  Navigator.pop(context);
                                                                                }
                                                                              },
                                                                              child: Text("Sure", style: TextStyle(color: Colors.blue))),
                                                                        ],
                                                                      );
                                                                    });
                                                              },
                                                              child: Container(
                                                                width: 110,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4,
                                                                        vertical:
                                                                            5),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .red),
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  // border: Border.all(color: Colors.blue, width: 1),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Remove Item",
                                                                    style: TextStyle(
                                                                        letterSpacing: 1,
                                                                        fontSize: 10,
                                                                        color: Color.fromARGB(255, 250, 0, 0),
                                                                        // fontFamily: font,
                                                                        fontWeight: FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            // Container(
                                                            //   decoration: BoxDecoration(
                                                            //       color: Color.fromARGB(
                                                            //           255, 255, 255, 255)),
                                                            //   child: SizedBox(
                                                            //     height: 20,
                                                            //     child: DropDown(
                                                            //       items: List.generate(
                                                            //           snapshot.data!.items[index]
                                                            //               .attribute.length,
                                                            //           (i) => snapshot
                                                            //               .data!
                                                            //               .items[index]
                                                            //               .attribute[n]
                                                            //               .attr_name!),
                                                            //       hint: Text("2 KG"),
                                                            //       icon: Icon(
                                                            //         Icons.expand_more,
                                                            //         color: Colors.blue,
                                                            //       ),
                                                            //       onChanged: print,
                                                            //     ),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
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
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     // crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "Sub Total",
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
                            //         "??? ${snapshot.data!.total!.subtotal}",
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
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
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
                            //         "- ??? ${snapshot.data!.total!.discount}",
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
                              child: Column(
                                children: [
                                  Row(
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
                                            // fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "??? ${snapshot.data!.total!.subtotal}",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            // fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
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
                                          SizedBox(
                                            width: 5,
                                          ),
                                          snapshot.data!.total!.bundledissount
                                                      .toString() ==
                                                  "0"
                                              ? Container()
                                              : Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.green[800]),
                                                  child: Text(
                                                    '5% Applied',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "- ??? ${snapshot.data!.total!.bundledissount}",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            // fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
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
                                            // fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "??? ${snapshot.data!.total!.total}",
                                        style: TextStyle(
                                            letterSpacing: 1,
                                            fontSize: 16,
                                            color: Colors.black,
                                            // fontFamily: font,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
                                  // fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "??? ${snapshot.data!.total!.total} ",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 1.5,
                                  fontSize: 16,
                                  color: Colors.black,
                                  // fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      // height: 60,
                                      // width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          "??? ${snapshot.data!.total!.finaltotal}",
                                          style: const TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 28,
                                              color: Colors.black,
                                              // fontFamily: font,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -10,
                                      left: 90,
                                      child: Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.green,
                                          border: Border.all(
                                              color: Colors.blue, width: 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(1,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          " 5% off ",
                                          style: TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 12,
                                              color: Colors.white,
                                              // fontFamily: font,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/changeaddress',
                                            arguments: {'id': rcvdData['id']});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.edit,
                                          size: 15,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
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

                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        snapshot.data!.status == 'Skipped'
                            ? Container(
                                height: 40,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 248, 130, 130),
                                  // border: Border.all(color: Colors.blue, width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 255, 132, 132)
                                          .withOpacity(0.4),
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
                                      "Skipped",
                                      style: TextStyle(
                                          // letterSpacing: 1,
                                          fontSize: 12,
                                          color: Colors.white,
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
                            : InkWell(
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Are Your Sure?"),
                                          content: Text(
                                              'Are you sure to Skip this Bundle for this month?'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("No",
                                                  style: TextStyle(
                                                      color: Colors.blue)),
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                            ),
                                            FlatButton(
                                                onPressed: () async {
                                                  HomeApi _api = HomeApi();
                                                  Map data = await _api
                                                      .skipSubs(rcvdData['id']);
                                                  print(data);
                                                  if (data['response'] == "1") {
                                                    setState(() {});
                                                    Fluttertoast.showToast(
                                                        msg: data['msg']);
                                                    Navigator.pop(context);
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: data['msg']);
                                                  }
                                                },
                                                child: Text("Sure",
                                                    style: TextStyle(
                                                        color: Colors.blue))),
                                          ],
                                        );
                                      });
                                },
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
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
                                          "Skip for This Month",
                                          style: TextStyle(
                                              // letterSpacing: 1,
                                              fontSize: 12,
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              // fontFamily: font,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        isCancelled == 1
                            ? InkWell(
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 243, 124, 115),
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
                                          "Cancelled",
                                          style: TextStyle(
                                              // letterSpacing: 1,
                                              fontSize: 12,
                                              color: Colors.white,
                                              // fontFamily: font,
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
                              )
                            : InkWell(
                                onTap: () async {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Are Your Sure?"),
                                          content: const Text(
                                              'Are you sure to cancel this bundle subscription?'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("No",
                                                  style: TextStyle(
                                                      color: Colors.blue)),
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                            ),
                                            FlatButton(
                                                onPressed: () async {
                                                  HomeApi _api = HomeApi();
                                                  Map data =
                                                      await _api.cancelSubs(
                                                          rcvdData['id']);
                                                  print(data);
                                                  if (data['response'] == '1') {
                                                    setState(() {
                                                      isCancelled = 1;
                                                      homebloc.fetchSublist();
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg: data['msg']);
                                                    Navigator.pop(context);
                                                    return;
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: data['msg']);
                                                  }
                                                },
                                                child: Text("Sure",
                                                    style: TextStyle(
                                                        color: Colors.blue))),
                                          ],
                                        );
                                      });
                                },
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
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
                                          "Cancel Subscription",
                                          style: TextStyle(
                                              // letterSpacing: 1,
                                              fontSize: 12,
                                              color: Colors.white,
                                              // fontFamily: font,
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
