// ignore_for_file: unnecessary_const

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
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          // leadingWidth: 0,
          // leading: Container(),
          title: const Text(
            'My Subscription',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<SubsListModal>(
                stream: homebloc.getsubsList.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Shimmer_home();

                  return Column(
                    children: [
                      snapshot.data!.data.length == 0
                          ? Center(
                              child: Column(
                                children: [
                                  Lottie.asset(
                                    'assets/empty.json',
                                    height: 200,
                                    repeat: false,
                                  ),
                                  Text('No Subscription Found')
                                ],
                              ),
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
                                                  offset: const Offset(1,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.start,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 150,
                                                  width: 150,
                                                  child: Image.asset(
                                                    'assets/subscription.png',
                                                    errorBuilder: ((context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                            'assets/subscription.png')),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
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
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: const [
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
                                                        const SizedBox(
                                                          width: 30,
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
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .date!,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .amount!,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .data[index]
                                                                  .status!,
                                                              style: const TextStyle(
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
          const SizedBox(
            height: 50,
          ),
          Container(
              padding: const EdgeInsets.all(50),
              width: MediaQuery.of(context).size.width / 2 + 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    const BoxShadow(
                      color: const Color.fromARGB(255, 174, 174, 174),
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
