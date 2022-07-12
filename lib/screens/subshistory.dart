import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/screens/mysublist.dart';
import 'package:boxoniq/shimmer/newshimmer.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Subshistory extends StatefulWidget {
  const Subshistory({Key? key}) : super(key: key);

  @override
  State<Subshistory> createState() => _SubshistoryState();
}

class _SubshistoryState extends State<Subshistory> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    homebloc.fetchsubsHistory();
    homebloc.fetchsubscancelHistory();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'Subscription History',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      activeIndex = 0;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeIndex == 0 ? Colors.amber : Colors.grey,
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
                        "Active",
                        style: TextStyle(
                            // letterSpacing: 1,
                            fontSize: 12,
                            color: activeIndex == 0
                                ? Colors.black
                                : Color.fromARGB(255, 255, 255, 255),
                            // fontFamily: font,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      activeIndex = 1;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: activeIndex == 1 ? Colors.amber : Colors.grey,
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
                        "Cancelled",
                        style: TextStyle(
                            // letterSpacing: 1,
                            fontSize: 12,
                            color: activeIndex == 1
                                ? Colors.black
                                : Color.fromARGB(255, 255, 255, 255),
                            // fontFamily: font,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            activeIndex == 0
                ? StreamBuilder<MyOrderModal>(
                    stream: homebloc.getSubshistory.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Shimmer_home();
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          snapshot.data!.data.length == 0
                              ? Column(
                                  children: [
                                    Lottie.asset(
                                      'assets/empty.json',
                                      height: 200,
                                      repeat: false,
                                    ),
                                    Text('No data found')
                                  ],
                                )
                              : Column(
                                  children: List.generate(
                                      snapshot.data!.data.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/mysubsdetail',
                                                    arguments: {
                                                      'id': snapshot.data!
                                                          .data[index].orderid,
                                                      'is_cancelled':
                                                          '$activeIndex'
                                                    });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            78, 158, 158, 158)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        width: 100,
                                                        height: 100,
                                                        child: Image.network(
                                                          snapshot.data!
                                                              .data[index].img!,
                                                          fit: BoxFit.contain,
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'OrderId :',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text('Date :',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text('Amount :',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text('Status :',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text('Month :',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data[
                                                                          index]
                                                                      .neworderid!,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .date!)
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '₹ ${snapshot.data!.data[index].amount!}')
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .status!)
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '${index + 1}')
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                )
                        ],
                      );
                    })
                : StreamBuilder<MyOrderModal>(
                    stream: homebloc.getSubcancelshistory.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Shimmer_home();
                      return Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          snapshot.data!.data.length == 0
                              ? Column(
                                  children: [
                                    Lottie.asset(
                                      'assets/empty.json',
                                      height: 200,
                                      repeat: false,
                                    ),
                                    Text('No data found')
                                  ],
                                )
                              : Column(
                                  children: List.generate(
                                      snapshot.data!.data.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/mysubsdetail',
                                                    arguments: {
                                                      'id': snapshot.data!
                                                          .data[index].orderid,
                                                      'is_cancelled':
                                                          '$activeIndex'
                                                    });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            78, 158, 158, 158)),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        width: 100,
                                                        height: 100,
                                                        child: Image.network(
                                                          snapshot.data!
                                                              .data[index].img!,
                                                          fit: BoxFit.contain,
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  'OrderId :',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text('Date :',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text('Amount :',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text('Status :',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data[
                                                                          index]
                                                                      .neworderid!,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .date!)
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '₹ ${snapshot.data!.data[index].amount!}')
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .status!)
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                )
                        ],
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
