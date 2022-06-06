import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/shimmer/newshimmer.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class Mysublist extends StatelessWidget {
  const Mysublist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homebloc.fetchSublist();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          // leadingWidth: 0,
          // leading: Container(),
          title: Text(
            'My Subscription',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder<SubsListModal>(
                stream: homebloc.getsubsList.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Shimmer_home();

                  return Column(
                    children: [
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
                                (index) => Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            // Fluttertoast.showToast(
                                            //     msg: 'Working on this flow');
                                            // return;
                                            Navigator.pushNamed(context,
                                                '/mybundalSubscription',
                                                arguments: {
                                                  'id': snapshot.data!
                                                      .data[index].order_id
                                                });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                30,
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
                                                SizedBox(
                                                  height: 120,
                                                  width: 100,
                                                  child: Image.network(
                                                    snapshot
                                                        .data!.data[index].img!,
                                                    errorBuilder: ((context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.network(
                                                            'https://img.freepik.com/free-vector/error-404-concept-illustration_114360-1811.jpg?w=2000')),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    // Text(
                                                    //   "Popular Searches",
                                                    //   style: TextStyle(
                                                    //       letterSpacing: 1,
                                                    //       fontSize: 16,
                                                    //       color: Colors.black,
                                                    //       // fontFamily: font,
                                                    //       fontWeight: FontWeight.bold),
                                                    // ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Order id:',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Date',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Amount:',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              'Status:',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
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
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .order_id!,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .date!,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .amount!,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .status!,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class ShimmerLottie extends StatelessWidget {
  const ShimmerLottie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
              padding: EdgeInsets.all(50),
              width: MediaQuery.of(context).size.width / 2 + 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Color.fromARGB(255, 174, 174, 174),
                      blurRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Lottie.asset('assets/loader.json',
                      height: 150, frameRate: FrameRate(120.0)))),
        ],
      ),
    );
  }
}
