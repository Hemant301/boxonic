import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class ProductDitels extends StatefulWidget {
  const ProductDitels({Key? key}) : super(key: key);

  @override
  State<ProductDitels> createState() => _ProductDitelsState();
}

class _ProductDitelsState extends State<ProductDitels> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData['data']);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightWhite2,
          // leading: Container(),
          // leadingWidth: 0,
          // leading: Container(),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            "Boro Plus",
            style: TextStyle(color: Colors.black, fontFamily: font),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/81hmur09-TL._SX450_.jpg"),
                              fit: BoxFit.cover))),
                  // Positioned(
                  //   top: 40,
                  //   left: 30,
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: Container(
                  //         height: 40,
                  //         width: 40,
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 12),
                  //           child: Center(child: Icon(Icons.arrow_back_ios)),
                  //         ),
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 20,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Baby Shop",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(children: [
                              Container(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                            border: Border.all(
                                                color: Colors.black)),
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
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: Text('+'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ])
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "MRP ₹ 2800",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 13,
                                color: Colors.black,
                                fontFamily: font,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "-25% OFF",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Price ₹ 2200",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 13,
                                color: Colors.black,
                                fontFamily: font,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 20,
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
                            Text(
                              "Attributes",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Chip(label: Text("300ml")),
                                      )),
                            )
                          ]),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 20,
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
                            Text(
                              "Product Discription",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "cream cream cream cream baby  cream cream cream cream",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 13,
                                color: Colors.black,
                                fontFamily: font,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ]),
                    )),
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 20,
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
                            Text(
                              "Key Features",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "cream cream cream cream baby  cream cream cream cream",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 13,
                                color: Colors.black,
                                fontFamily: font,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ]),
                    ))
              ]),
        ),
        bottomNavigationBar: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade100,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              // padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,

              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromARGB(255, 206, 206, 206), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: Text(
                  "Go to Bag",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                      color: Colors.red,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width / 2,

              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5),
                  color: lightWhite2,
                  // border: Border.all(color: Colors.blue, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 3), // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ));
  }
}
