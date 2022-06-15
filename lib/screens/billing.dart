import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/shimmer/newshimmer.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({Key? key}) : super(key: key);

  @override
  State<BillingPage> createState() => _BillingPageState();
}

String is_coupon = "0";
String coupon_Id = "0";

class _BillingPageState extends State<BillingPage> {
  int activeIndex = 1;
  int? couponIndex;
  int couponDiscount = 0;
  int? deliveryCharge = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkTotal();
  }

  checkTotal() async {
    List data = await homeApi.fetchTotalAmount() as List;
    // print('from init*******************+*+*+*+*+*+');
    print(data[0]['response']['total']);
    setState(() {
      totalamount = data[0]['response']['total'];
      is_coupon = "0";
      coupon_Id = "0";
    });
  }

  dynamic totalamount = 0;

  @override
  Widget build(BuildContext context) {
    homebloc.fetchcalAmount();
    homebloc.fetchGetCoupons();

    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: InkWell(
          onTap: () {
            print(is_coupon);
            print(coupon_Id);
          },
          child: Text(
            "Billing",
            style: TextStyle(
                // // letterSpacing: 1,
                fontSize: 18,
                color: grad2Color,
                // fontFamily: font,
                fontWeight: FontWeight.bold),
          ),
        ),
        // actions: [
        //   Center(
        //     child: Text(
        //       "₹ 9,785   ",
        //       style: TextStyle(
        //           // // letterSpacing: 1,
        //           fontSize: 18,
        //           color: grad2Color,
        //           // fontFamily: font,
        //           fontWeight: FontWeight.bold),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
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
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Coupons',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    StreamBuilder<CouponModal>(
                        stream: homebloc.getCouponscode.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Billing_shimmer(
                              width: 20,
                              number: 4,
                            );
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                snapshot.data!.coupons.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () async {
                                          HomeApi api = HomeApi();
                                          Map data = await api.applyCoupons(
                                              coupon: snapshot.data!
                                                  .coupons[index].coupon!);
                                          print(data);
                                          if (data['response'] == "1") {
                                            Fluttertoast.showToast(
                                                msg: data['msg']);

                                            setState(() {
                                              couponIndex = index;
                                              couponDiscount = data['discount'];
                                              is_coupon = "1";
                                              coupon_Id = snapshot.data!
                                                  .coupons[index].couponId!;
                                            });
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: data['msg']);
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              // backgroundImage: AssetImage("assets/1 9.png"),
                                              backgroundColor:
                                                  couponIndex == index
                                                      ? Colors.blue
                                                      : Colors.grey[300],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                // child: Image.asset(
                                                //   "assets/1 9.png",
                                                //   fit: BoxFit.contain,
                                                // ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.coupons[index]
                                                      .coupon!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(snapshot
                                                    .data!.coupons[index].msg!),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                          );
                        }),
                    couponDiscount == 0
                        ? Container()
                        : Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  couponIndex = null;
                                  couponDiscount = 0;
                                  is_coupon = "0";
                                  coupon_Id = '0';
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Remove Coupon',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 10),
                                ),
                              ),
                            )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              StreamBuilder<CalAmountModal>(
                  stream: homebloc.getCalculatedAmount.stream,
                  builder: (context, snapshot) {
                    // print('++++++++++${snapshot.data!.data[0]}');
                    if (!snapshot.hasData)
                      return Billing_shimmer(
                        width: 20,
                        number: 4,
                      );
                    return Container(
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
                                      // // letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '₹ ${snapshot.data!.data[0].response!.sub_total!}',
                                  style: TextStyle(
                                      // // letterSpacing: 1,
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
                                      // // letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                snapshot.data!.data[0].response!.bundle_disc ==
                                            '0' ||
                                        snapshot.data!.data[0].response!
                                                .bundle_disc ==
                                            0
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.green[800]),
                                        child: Text(
                                          '5% Applied',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "-₹ ${snapshot.data!.data[0].response!.bundle_disc}",
                                  style: TextStyle(
                                      // // letterSpacing: 1,
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
                                      // // letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                couponDiscount == 0
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.green[800]),
                                        child: Text(
                                          'Applied',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "-₹ ${couponDiscount}",
                                  style: TextStyle(
                                      // // letterSpacing: 1,
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
                                  "Delivery Charges",
                                  style: TextStyle(
                                      //  letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                deliveryCharge == 0
                                    ? Container()
                                    : Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.green[800]),
                                        child: Text(
                                          'Applied',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "₹ ${deliveryCharge}",
                                  style: TextStyle(
                                      // // letterSpacing: 1,
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
                                  "Total",
                                  style: TextStyle(
                                      // // letterSpacing: 1,
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      // fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                // Text(
                                //   "₹ ${(totalamount + snapshot.data!.data[0].response!.delivery) - couponDiscount}",
                                //   style: TextStyle(
                                //       // // letterSpacing: 1,
                                //       fontSize: 16,
                                //       color: Colors.black,
                                //       // fontFamily: font,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                Text(
                                  "₹ ${(snapshot.data!.data[0].response!.total + deliveryCharge) - couponDiscount}",
                                  style: TextStyle(
                                      // // letterSpacing: 1,
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
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                "Checkout or Subscribe",
                style: TextStyle(
                    // // letterSpacing: 1,
                    fontSize: 16,
                    color: Colors.black,
                    // fontFamily: font,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                // height: 80,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.blue, width: 1),
                  color: Colors.white,
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
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          activeIndex = 1;
                          deliveryCharge = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        // height: 80,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color:
                                  activeIndex == 1 ? Colors.blue : Colors.grey,
                              width: 1),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: activeIndex == 1
                                  ? Colors.grey.withOpacity(0.4)
                                  : Colors.grey.withOpacity(0.2),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Monthly Subscription",
                                  style: TextStyle(
                                    // // letterSpacing: 1,
                                    fontSize: 12,
                                    color: Colors.black,
                                    // fontFamily: font,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 10,
                                  // backgroundImage: AssetImage("assets/1 9.png"),
                                  backgroundColor: activeIndex == 1
                                      ? Colors.blue
                                      : Colors.grey[300],
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    // child: Image.asset(
                                    //   "assets/1 9.png",
                                    //   fit: BoxFit.contain,
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // padding: EdgeInsets.all(20),
                              height: 40,
                              width: MediaQuery.of(context).size.width - 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green,
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
                                child: Padding(
                                  padding:  EdgeInsets.all(5.0),
                                  child: Text(
                                    "Get 5% Discount on Every Orders + Additional Benefits",
                                    style: TextStyle(
                                      // // letterSpacing: 1,
                                      fontSize: 12,
                                      color: Colors.white,
                                      // fontFamily: font,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<CalAmountModal>(
                        stream: homebloc.getCalculatedAmount.stream,
                        builder: (context, snapshot) {
                          // print('++++++++++${snapshot.data!.data[0]}');
                          if (!snapshot.hasData) {
                            return Billing_shimmer(
                              number: 4,
                              width: 20,
                            );
                          }
                          return InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = 0;
                              });
                              if (snapshot.data!.data[0].response!.total <
                                  500) {
                                setState(() {
                                  deliveryCharge = 49;
                                });
                              } else {
                                deliveryCharge = 0;
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              // height: 80,
                              width: MediaQuery.of(context).size.width - 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: activeIndex == 0
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 1),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: activeIndex == 0
                                        ? Colors.grey.withOpacity(0.4)
                                        : Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(
                                        1, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "One Time Purchase",
                                    style: TextStyle(
                                      // // letterSpacing: 1,
                                      fontSize: 12,
                                      color: Colors.black,
                                      // fontFamily: font,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 10,
                                    // backgroundImage: AssetImage("assets/1 9.png"),
                                    backgroundColor: activeIndex == 0
                                        ? Colors.blue
                                        : Colors.grey[300],
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      // child: Image.asset(
                                      //   "assets/1 9.png",
                                      //   fit: BoxFit.contain,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<CalAmountModal>(
                  stream: homebloc.getCalculatedAmount.stream,
                  builder: (context, snapshot) {
                    // print('++++++++++${snapshot.data!.data[0]}');
                    if (!snapshot.hasData) return Container();
                    return InkWell(
                      onTap: () async {
                        if (activeIndex == 1) {
                          Map data = await homeApi.checkAlreadysubs();
                          if (data['response'] == 1) {
                            Fluttertoast.showToast(msg: data['msg']);
                            return;
                          }
                        }
                        // print(activeIndex);
                        // return;
                        // if (activeIndex == 0) {
                        //   Navigator.pushNamed(context, '/subscription');
                        // } else {
                        //   Navigator.pushNamed(context, '/thankyou');
                        // }
                        Navigator.pushNamed(context, '/address', arguments: {
                          'c_discount': couponDiscount,
                          'b_discount':
                              snapshot.data!.data[0].response!.bundle_disc,
                          'sub_total':
                              snapshot.data!.data[0].response!.sub_total,
                          'activeIndex': activeIndex,
                          'total_amount':
                              (snapshot.data!.data[0].response!.total +
                                      deliveryCharge) -
                                  couponDiscount,
                          'subs': activeIndex.toString()
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                                color: Color.fromARGB(96, 255, 255, 255)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          'Proceed',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
