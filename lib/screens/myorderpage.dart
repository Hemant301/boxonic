import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homebloc.fetchMyOrder();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightWhite2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'My Orders',
            style: TextStyle(color: Colors.black),
          )),
      body: SingleChildScrollView(
        child: StreamBuilder<MyOrderModal>(
            stream: homebloc.getMyOrder.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        snapshot.data!.data.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/myorderdetail',
                                      arguments: {
                                        'id': snapshot.data!.data[index].orderid
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              78, 158, 158, 158)),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 100,
                                          height: 100,
                                          child: Image.network(
                                            snapshot.data!.data[index].img!,
                                            fit: BoxFit.contain,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'OrderId :',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data!.data[index]
                                                        .orderid!,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(snapshot
                                                      .data!.data[index].date!)
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
                                                  Text(snapshot.data!
                                                      .data[index].status!)
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
      ),
    );
  }
}
