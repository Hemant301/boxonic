import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

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
          title: Text(
            'My Subscriptions',
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
                  if (!snapshot.hasData) return Container();
                  return Column(
                    children: List.generate(
                      snapshot.data!.data.length,
                      (index) => Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/mybundalSubscription', arguments: {
                                'id': snapshot.data!.data[index].order_id
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 30,
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
                                  SizedBox(
                                    height: 120,
                                    width: 100,
                                    child: Image.network(
                                      snapshot.data!.data[index].img!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      //       fontFamily: font,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Order id:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Date',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Amount:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.data[index]
                                                    .order_id!,
                                                style: TextStyle(),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.data[index].date!,
                                                style: TextStyle(),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.data[index].amount!,
                                                style: TextStyle(),
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
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
