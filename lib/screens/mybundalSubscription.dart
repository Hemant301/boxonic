import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyBundalSubscription extends StatefulWidget {
  const MyBundalSubscription({Key? key}) : super(key: key);

  @override
  State<MyBundalSubscription> createState() => _MyBundalSubscriptionState();
}

class _MyBundalSubscriptionState extends State<MyBundalSubscription> {
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
          StreamBuilder<Myordermodal>(
              stream: homebloc.getSubsdetail.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      if (snapshot.data!.cancel == 1) {
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
                              fontFamily: font,
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
                      height: 10,
                    ),
                    Text(
                      'Product delivered ${snapshot.data!.delivered} out of ${snapshot.data!.subs_month} Months',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
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
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                                            fit: BoxFit.contain,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
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
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    if (snapshot.data!.cancel ==
                                                        1) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Subscription is already cancelled');
                                                      return;
                                                    }
                                                    HomeApi _api = HomeApi();
                                                    Map data = await _api.updateQuantity(
                                                        process: rcvdData['id'],
                                                        attr_price: snapshot
                                                            .data!
                                                            .items[index]
                                                            .attr_price,
                                                        cartid: snapshot
                                                            .data!
                                                            .items[index]
                                                            .cart_id!,
                                                        qty: (int.parse(snapshot
                                                                    .data!
                                                                    .items[
                                                                        index]
                                                                    .quantity!) -
                                                                1)
                                                            .toString());
                                                    if (data['response'] ==
                                                        '1') {
                                                      setState(() {});
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Successfully updated');
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Something went wrong');
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                        // shape: BoxShape.circle,
                                                        // border: Border.all(
                                                        //     color: Colors.black)
                                                        ),
                                                    child: Icon(Icons
                                                        .arrow_drop_down_outlined),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                      // shape: BoxShape.circle,
                                                      // border: Border.all(
                                                      //     color: Colors.black)
                                                      ),
                                                  child: Text(
                                                      '${snapshot.data!.items[index].quantity}'),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    if (snapshot.data!.cancel ==
                                                        1) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Subscription is already cancelled');
                                                      return;
                                                    }
                                                    HomeApi _api = HomeApi();
                                                    Map data = await _api.updateQuantity(
                                                        process: rcvdData['id'],
                                                        attr_price: snapshot
                                                            .data!
                                                            .items[index]
                                                            .attr_price,
                                                        cartid: snapshot
                                                            .data!
                                                            .items[index]
                                                            .cart_id!,
                                                        qty: (int.parse(snapshot
                                                                    .data!
                                                                    .items[
                                                                        index]
                                                                    .quantity!) +
                                                                1)
                                                            .toString());
                                                    if (data['response'] ==
                                                        '1') {
                                                      setState(() {});
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Successfully updated');
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Something went wrong');
                                                    }
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(1),
                                                    decoration: BoxDecoration(
                                                        // shape: BoxShape.circle,
                                                        // border: Border.all(
                                                        //     color: Colors.black)
                                                        ),
                                                    child: Icon(Icons
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
                                              'Price : ₹ ${snapshot.data!.items[index].attr_price}')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              'Total : ₹ ${snapshot.data!.items[index].amount}'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              'Attr : ₹ ${snapshot.data!.items[index].item_attr}'),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: List.generate(
                                                snapshot.data!.items[index]
                                                    .attribute.length,
                                                (i) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          if (snapshot.data!
                                                                  .cancel ==
                                                              1) {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Subscription is already cancelled');
                                                            return;
                                                          }
                                                          HomeApi _api =
                                                              HomeApi();
                                                          Map data = await _api.updateAttr(
                                                              attrprice: snapshot
                                                                  .data!
                                                                  .items[index]
                                                                  .attribute[i]
                                                                  .price,
                                                              processid:
                                                                  rcvdData[
                                                                      'id'],
                                                              qty: snapshot
                                                                  .data!
                                                                  .items[index]
                                                                  .quantity!,
                                                              cartid: snapshot
                                                                  .data!
                                                                  .items[index]
                                                                  .cart_id!,
                                                              item_id: snapshot
                                                                  .data!
                                                                  .items[index]
                                                                  .item_id!,
                                                              attrid: snapshot
                                                                  .data!
                                                                  .items[index]
                                                                  .attribute[i]
                                                                  .attr_id!
                                                                  .toString());
                                                          if (data[
                                                                  'response'] ==
                                                              '1') {
                                                            setState(() {});
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Successfully updated');
                                                          } else {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Something went wrong');
                                                          }
                                                        },
                                                        child: Chip(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1),
                                                            backgroundColor: snapshot
                                                                        .data!
                                                                        .items[
                                                                            index]
                                                                        .item_attr ==
                                                                    snapshot
                                                                        .data!
                                                                        .items[
                                                                            index]
                                                                        .attribute[
                                                                            i]
                                                                        .attr_name!
                                                                ? Colors.amber
                                                                : Colors
                                                                    .grey[300],
                                                            label: Text(
                                                              snapshot
                                                                  .data!
                                                                  .items[index]
                                                                  .attribute[i]
                                                                  .attr_name!,
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              if (snapshot.data!.cancel == 1) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Subscription is already cancelled');
                                                return;
                                              }
                                              HomeApi _api = HomeApi();
                                              List data =
                                                  await _api.deletesubsItem(
                                                      snapshot
                                                          .data!
                                                          .items[index]
                                                          .cart_id!,
                                                      rcvdData['id']);
                                              if (data[0]['response'] == true) {
                                                setState(() {});
                                              }
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
                                          //               .attribute[i]
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
                              )
                            : InkWell(
                                onTap: () async {
                                  HomeApi _api = HomeApi();
                                  Map data =
                                      await _api.skipSubs(rcvdData['id']);
                                  print(data);
                                  if (data['response'] == "1") {
                                    setState(() {});
                                    Fluttertoast.showToast(
                                        msg: 'Successfully skiped');
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Successfully skiped');
                                  }
                                  // Navigator.pushNamed(context, "/billing");
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
                                      color: Colors.grey,
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
                        snapshot.data!.cancel == 1
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
                                      color: Color.fromARGB(255, 243, 124, 115),
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
                                          "Cancelled",
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
                              )
                            : InkWell(
                                onTap: () async {
                                  // Navigator.pushNamed(context, "/billing");
                                  HomeApi _api = HomeApi();
                                  Map data =
                                      await _api.cancelSubs(rcvdData['id']);
                                  print(data);
                                  if (data['response'] == '1') {
                                    setState(() {});
                                    Fluttertoast.showToast(msg: data['msg']);
                                    return;
                                  } else {
                                    Fluttertoast.showToast(msg: data['msg']);
                                  }
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
