import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class BundleCreatorPage extends StatefulWidget {
  const BundleCreatorPage({Key? key}) : super(key: key);

  @override
  State<BundleCreatorPage> createState() => _BundleCreatorPageState();
}

class _BundleCreatorPageState extends State<BundleCreatorPage> {
  int activeIndex = 5;
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    10,
                    (index) => Container(
                          width: MediaQuery.of(context).size.width / (10 + 1),
                          height: 2,
                          color: (activeIndex - 1) == index
                              ? Colors.black
                              : Colors.grey,
                        )),
              ),
              SizedBox(
                height: 15,
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
                            radius: 30,
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
                              fontSize: 24,
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
                            "Vitamin Category \nDescription will go here",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
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
              Column(children: List.generate(5, (index) => ProductsCard()))
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
            InkWell(
              onTap: () {
                if (activeIndex == 1) {
                  return;
                } else {
                  setState(() {
                    activeIndex--;
                  });
                }
              },
              child: Container(
                width: 80,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
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
            ),
            Container(
              // width: 80,
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
                  "Proceed to checkout",
                  style: TextStyle(
                      // letterSpacing: 1,
                      fontSize: 12,
                      color: Colors.green,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (activeIndex == 10) {
                  return;
                } else {
                  setState(() {
                    activeIndex++;
                  });
                }

                // Navigator.pushNamed(context, "/previewBundal");
              },
              child: Container(
                width: 80,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                    SizedBox(
                      width: 5,
                    ),
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
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
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

class ProductsCard extends StatefulWidget {
  const ProductsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  int count = 1;
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: MediaQuery.of(context).size.width - 180,
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
                  Container(
                    width: MediaQuery.of(context).size.width / 2 + 30,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            5,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        colorIndex = index;
                                      });
                                    },
                                    child: Chip(
                                        backgroundColor: colorIndex == index
                                            ? lightWhite3
                                            : Colors.grey[300],
                                        label: Text(
                                          '₹500/kg',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                  ),
                                )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                if (count == 1) {
                                  return;
                                } else {
                                  setState(() {
                                    count--;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)),
                                child: Text('--'),
                              ),
                            ),
                            Container(
                              child: Text('$count'),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black)),
                                child: Text('+'),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 120,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff53900F),
                          // border: Border.all(color: Colors.blue, width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "Add to bag",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   width: 120,
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(5),
                      //     color: Color(0xff53900F),
                      //     // border: Border.all(color: Colors.blue, width: 1),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       "Add to bag",
                      //       style: TextStyle(
                      //           letterSpacing: 1,
                      //           fontSize: 10,
                      //           color: Colors.white,
                      //           fontFamily: font,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     showDialog(
                      //         context: context,
                      //         builder: (BuildContext context) {
                      //           return AlertDialog(
                      //             title: Row(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text("Select"),
                      //                 InkWell(
                      //                   onTap: () {
                      //                     Navigator.pop(context);
                      //                   },
                      //                   child: Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Icon(Icons.close),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //             content:
                      //                 Text('Select Your Preffered Attribute'),
                      //             actions: <Widget>[
                      //               Column(
                      //                 children: List.generate(
                      //                     5,
                      //                     (index) => Align(
                      //                           alignment: Alignment.center,
                      //                           child: Column(
                      //                             children: [
                      //                               Container(
                      //                                 padding:
                      //                                     EdgeInsets.all(10),
                      //                                 child: Text('₹ 500 /Kg'),
                      //                               ),
                      //                               Container(
                      //                                 width: 30,
                      //                                 height: 1,
                      //                                 color: Colors.black38,
                      //                               )
                      //                             ],
                      //                           ),
                      //                         )),
                      //               )
                      //             ],
                      //           );
                      //         });
                      //   },
                      //   child: Container(
                      //     // width: 120,
                      //     padding:
                      //         EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //       color: Color(0xffC4C4C4),
                      //       // border: Border.all(color: Colors.blue, width: 1),
                      //     ),
                      //     child: Center(
                      //       child: Row(
                      //         children: [
                      //           Text(
                      //             "₹500 / Kg",
                      //             style: TextStyle(
                      //                 letterSpacing: 1,
                      //                 fontSize: 10,
                      //                 color: Colors.black,
                      //                 fontFamily: font,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //           Icon(
                      //             Icons.expand_more_outlined,
                      //             size: 10,
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
    );
  }
}
