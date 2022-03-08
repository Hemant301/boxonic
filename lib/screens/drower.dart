import 'package:boxoniq/screens/homescreen.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class DrawersPage extends StatelessWidget {
  const DrawersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 450,
                width: MediaQuery.of(context).size.width,
                // color: Colors.white,
                color: lightWhite2,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Account",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 18,
                                    color: grad2Color,
                                    fontFamily: font,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                //  height: MediaQuery.of(context).size.height - 450,
                                width: MediaQuery.of(context).size.width - 180,
                                child: Text(
                                  "Edit & Manage Your Boxoniq Account from here",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 10,
                                      color: grad2Color,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/package.png",
                              ),
                              SizedBox(
                                height: 80,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Wallet",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 12,
                              color: grad2Color,
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset("assets/wallet (1) 3.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Bundle Subscription",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 12,
                              color: grad2Color,
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset("assets/bbo.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order History",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 12,
                              color: grad2Color,
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset("assets/thistorys.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Customer Support",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  color: grad2Color,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "info@boxonic.com",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontFamily: font,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Image.asset("assets/customer-service (1) 1.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset("assets/user (9) 1.png"),
                        Text(
                          "  MY DETAILS",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: font,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Mobile Number",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          color: grad2Color,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.edit, size: 15)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "8210925188",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset("assets/telephone-call (1) 1.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          color: grad2Color,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.edit, size: 15)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "gupta.hgk@gmail.com",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset("assets/gmail (1) 1.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "My Address",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          color: grad2Color,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.edit, size: 15)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Harmu Housing Colony, Vasa...",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset("assets/address 1.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Baby Name",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          color: grad2Color,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.edit, size: 15)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Santosh Kumar",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset("assets/address 1.png")
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Baby D.O.B",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          color: grad2Color,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.edit, size: 15)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "02/10/2021",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 10,
                                      color: Colors.grey,
                                      fontFamily: font,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset("assets/address 1.png")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(color: Color(0xffFF4F4F)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }
}
