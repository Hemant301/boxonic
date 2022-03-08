import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class PreviewBundalPage extends StatelessWidget {
  const PreviewBundalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        leading: Image.asset("assets/magic-box (1) 1.png"),
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
            child: Text(
              "₹ 9,785   ",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 18,
                  color: grad2Color,
                  fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Category 1",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                  children: List.generate(
                      2,
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
                                        Container(
                                          height: 120,
                                          width: 100,
                                          child: Image.asset(
                                            "assets/hello_bello_vitamins_MENS_front_580x 1.png",
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ],
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
                                        Text(
                                          "Popular Searches",
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
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              180,
                                          child: Text(
                                            "Contains 14 essential vitamins and minerals. Vegan, USDA certified organic, and nonGMO.",
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
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
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
                                                      "₹500 / Kg",
                                                      style: TextStyle(
                                                          letterSpacing: 1,
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          fontFamily: font,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .expand_more_outlined,
                                                      size: 10,
                                                    )
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Category 2",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                  children: List.generate(
                      2,
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
                                        Container(
                                          height: 120,
                                          width: 100,
                                          child: Image.asset(
                                            "assets/hello_bello_vitamins_MENS_front_580x 1.png",
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ],
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
                                        Text(
                                          "Popular Searches",
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
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              180,
                                          child: Text(
                                            "Contains 14 essential vitamins and minerals. Vegan, USDA certified organic, and nonGMO.",
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
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
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
                                                      "₹500 / Kg",
                                                      style: TextStyle(
                                                          letterSpacing: 1,
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          fontFamily: font,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .expand_more_outlined,
                                                      size: 10,
                                                    )
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
                          )))
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/billing");
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
      ),
    );
  }
}
