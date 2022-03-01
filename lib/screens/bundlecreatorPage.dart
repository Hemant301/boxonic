import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class BundleCreatorPage extends StatelessWidget {
  const BundleCreatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grad1Color,
      appBar: AppBar(
        backgroundColor: lightWhite2,
        leading: Image.asset("assets/magic-box (1) 1.png"),
        title: Text(
          "Bundle Creator",
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
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/1 9.png"),
                            backgroundColor: Color(0xffD3C6F9).withOpacity(0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              // child: Image.asset(
                              //   "assets/1 9.png",
                              //   fit: BoxFit.contain,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Baby Oil",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 22,
                              color: Colors.black,
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 180,
                          child: Text(
                            "Vitamin Category Description will go here",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: font,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                  children: List.generate(
                      5,
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
                                          child: Image.asset(
                                              "assets/hello_bello_vitamins_MENS_front_580x 1.png"),
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
                                              width: 80,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.grey,
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
                                              child: Text(
                                                "Remove Item",
                                                style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontFamily: font,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            DropDown(
                                              items: ["3 KG", "5 KG", "10 KG"],
                                              hint: Text("2 KG"),
                                              icon: Icon(
                                                Icons.expand_more,
                                                color: Colors.blue,
                                              ),
                                              onChanged: print,
                                            ),
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
      bottomNavigationBar: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: lightWhite2,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
                children: [
                  Image.asset("assets/Vector (1).png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Prev",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: font,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: Colors.green, width: 1),
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
                  "Skip",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      color: Colors.green,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/previewBundal");
              },
              child: Container(
                width: 80,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
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
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset("assets/Vector.png"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
