import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class PreviewBundalPage extends StatefulWidget {
  const PreviewBundalPage({Key? key}) : super(key: key);

  @override
  State<PreviewBundalPage> createState() => _PreviewBundalPageState();
}

class _PreviewBundalPageState extends State<PreviewBundalPage> {
  @override
  Widget build(BuildContext context) {
    homebloc.checkamount();
    homebloc.fetchbundleItems(userCred.getUserId());
    print(userCred.getUserId());
    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: lightWhite2,
        // leading: Image.asset("assets/magic-box (1) 1.png"),
        title: Text(
          "Preview",
          style: TextStyle(
              letterSpacing: 1,
              fontSize: 18,
              color: grad2Color,
              fontFamily: font,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Center(
            child: StreamBuilder<CheckAmountModal>(
                stream: homebloc.getcheckAmount.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "₹ ${snapshot.data!.totalamount.toString()}",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          color: grad2Color,
                          fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }),
          ),
        ],
      ),
      body: StreamBuilder<BundleitemModal>(
          stream: homebloc.getBundleitems.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      snapshot.data!.bundal.length == 0
                          ? Center(
                              child: Column(
                              children: [
                                Lottie.asset('assets/empty.json',
                                    repeat: false, height: 200),
                                Text(
                                  'Your Box is Empty',
                                  style: TextStyle(fontFamily: font),
                                )
                              ],
                            ))
                          :
                          // Column(
                          //     children: List.generate(
                          //       snapshot.data!.bundal.length,
                          //       (index) => PreviewItem(
                          //           onTab: () async {
                          //             HomeApi _api = HomeApi();
                          //             List a = await _api.deletecartItem(
                          //                 snapshot.data!.bundal[index]
                          //                     .product[index].Cart_id!);
                          //             print(a[0]['response']);
                          //             if (a[0]['response'] == true) {
                          //               setState(() {});
                          //               Fluttertoast.showToast(
                          //                   msg: 'Deleted Successfully');
                          //             } else {
                          //               Fluttertoast.showToast(
                          //                   msg: 'Somehing went wrong');
                          //             }
                          //           },
                          //           data: snapshot.data!.bundal[index]),
                          //     ),
                          //   ),

                          // ],

                          Column(
                              children: List.generate(
                                  snapshot.data!.bundal.length,
                                  (index) => Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                snapshot
                                                    .data!.bundal[index].title!,
                                                style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontSize: 16,
                                                    color: Colors.grey[500],
                                                    fontFamily: font,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Column(
                                              children: List.generate(
                                                  snapshot.data!.bundal[index]
                                                      .product.length,
                                                  (i) => Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width -
                                                                40,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color:
                                                                  Colors.white,
                                                              // border: Border.all(color: Colors.blue, width: 1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.4),
                                                                  spreadRadius:
                                                                      1,
                                                                  blurRadius: 1,
                                                                  offset: Offset(
                                                                      1,
                                                                      3), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          120,
                                                                      width:
                                                                          100,
                                                                      child: Image
                                                                          .asset(
                                                                        snapshot
                                                                            .data!
                                                                            .bundal[index]
                                                                            .product[i]
                                                                            .img!,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                stackTrace) =>
                                                                            Image.network('https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?t=st=1648458079~exp=1648458679~hmac=22225d104f55882eeda53ca4bba904e4d687db4db62051a53fc670b06d89a94f&w=740'),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    )
                                                                  ],
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
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          2,
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data!
                                                                            .bundal[index]
                                                                            .product[i]
                                                                            .title!,
                                                                        maxLines:
                                                                            2,
                                                                        style: TextStyle(
                                                                            letterSpacing:
                                                                                1,
                                                                            fontSize:
                                                                                16,
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                font,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width -
                                                                          180,
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data!
                                                                            .bundal[index]
                                                                            .product[i]
                                                                            .desc!,
                                                                        maxLines:
                                                                            4,
                                                                        style:
                                                                            TextStyle(
                                                                          letterSpacing:
                                                                              1,
                                                                          fontSize:
                                                                              10,
                                                                          color:
                                                                              Colors.black,
                                                                          fontFamily:
                                                                              font,
                                                                          // fontWeight: FontWeight.bold
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          'Qty: ${snapshot.data!.bundal[index].product[i].qty!}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,

                                                                            letterSpacing:
                                                                                1,
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                Colors.black,
                                                                            fontFamily:
                                                                                font,
                                                                            // fontWeight: FontWeight.bold
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          'Price: ₹${snapshot.data!.bundal[index].product[i].price!}',
                                                                          style:
                                                                              TextStyle(
                                                                            letterSpacing:
                                                                                1,
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Colors.black,
                                                                            fontFamily:
                                                                                font,
                                                                            // fontWeight: FontWeight.bold
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          'Total: ₹${snapshot.data!.bundal[index].product[i].total!}',
                                                                          style:
                                                                              TextStyle(
                                                                            letterSpacing:
                                                                                1,
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Colors.black,
                                                                            fontFamily:
                                                                                font,
                                                                            // fontWeight: FontWeight.bold
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            HomeApi
                                                                                _api =
                                                                                HomeApi();
                                                                            List
                                                                                a =
                                                                                await _api.deletecartItem(snapshot.data!.bundal[index].product[i].Cart_id!);
                                                                            print(a[0]['response']);
                                                                            if (a[0]['response'] ==
                                                                                true) {
                                                                              setState(() {});
                                                                              Fluttertoast.showToast(msg: 'Deleted Successfully');
                                                                            } else {
                                                                              Fluttertoast.showToast(msg: 'Somehing went wrong');
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                120,
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              color: Color(0xff53900F),
                                                                              // border: Border.all(color: Colors.blue, width: 1),
                                                                            ),
                                                                            child:
                                                                                Center(
                                                                              child: Text(
                                                                                "Remove Item",
                                                                                style: TextStyle(letterSpacing: 1, fontSize: 10, color: Colors.white, fontFamily: font, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Container(
                                                                          // width: 120,
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 10,
                                                                              vertical: 5),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(5),
                                                                            color:
                                                                                Color(0xffC4C4C4),
                                                                            // border: Border.all(color: Colors.blue, width: 1),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text(
                                                                                  snapshot.data!.bundal[index].product[i].attribute!,
                                                                                  style: TextStyle(letterSpacing: 1, fontSize: 10, color: Colors.black, fontFamily: font, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        // Container(
                                                                        //   decoration: BoxDecoration(
                                                                        //       color: Color(0xffC4C4C4)),
                                                                        //   child: SizedBox(
                                                                        //     height: 20,
                                                                        //     child: DropDown(
                                                                        //       items: [
                                                                        //         "3 KG",
                                                                        //         "5 KG",
                                                                        //         "10 KG"
                                                                        //       ],
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
                                                      ))),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      )),
                            )
                    ]),
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: StreamBuilder<BundleitemModal>(
          stream: homebloc.getBundleitems.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return InkWell(
              onTap: () {
                if (snapshot.data!.bundal.length == 0) {
                  Fluttertoast.showToast(
                      msg: 'Add items to Bag', backgroundColor: Colors.red);
                  return;
                }
                Navigator.pushNamed(context, "/billing");
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.green,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Proceed to Billing",
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
            );
          }),
    );
  }
}

class PreviewItem extends StatefulWidget {
  PreviewItem({Key? key, this.data, this.onTab}) : super(key: key);
  BundledetailModal? data;
  void Function()? onTab;

  @override
  State<PreviewItem> createState() => _PreviewItemState();
}

class _PreviewItemState extends State<PreviewItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.data!.title!,
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  color: Colors.grey[500],
                  fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Column(
            children: List.generate(
                widget.data!.product.length,
                (index) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 100,
                                    child: Image.asset(
                                      widget.data!.product[index].img!,
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          Image.network(
                                              'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?t=st=1648458079~exp=1648458679~hmac=22225d104f55882eeda53ca4bba904e4d687db4db62051a53fc670b06d89a94f&w=740'),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
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
                                      widget.data!.product[index].title!,
                                      maxLines: 2,
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 180,
                                    child: Text(
                                      widget.data!.product[index].desc!,
                                      maxLines: 4,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontFamily: font,
                                        // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Qty: ${widget.data!.product[index].qty!}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,

                                          letterSpacing: 1,
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontFamily: font,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Price: ₹${widget.data!.product[index].price!}',
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: font,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Total: ₹${widget.data!.product[index].total!}',
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: font,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: widget.onTab,
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        // width: 120,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color(0xffC4C4C4),
                                          // border: Border.all(color: Colors.blue, width: 1),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                widget.data!.product[index]
                                                    .attribute!,
                                                style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontFamily: font,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //       color: Color(0xffC4C4C4)),
                                      //   child: SizedBox(
                                      //     height: 20,
                                      //     child: DropDown(
                                      //       items: [
                                      //         "3 KG",
                                      //         "5 KG",
                                      //         "10 KG"
                                      //       ],
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
                    ))),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
