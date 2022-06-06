import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/screens/homescreen.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';

class DrawersPage extends StatelessWidget {
  const DrawersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homebloc.fetchuserDetails();
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
                                    // fontFamily: font,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              StreamBuilder<UserdetailModal>(
                                  stream: homebloc.getuserdetails.stream,
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) return Container();
                                    return Text(
                                      'Hello ! ${snapshot.data!.name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    );
                                  }),
                              SizedBox(
                                height: 10,
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
                                      // fontFamily: font,
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
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Wallet');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Wallet",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset("assets/wallet (1) 3.png")
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/mysublist');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Subscription",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset("assets/subscribe.png", height: 35)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/subshistory');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subscription History",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.subscriptions_outlined)
                        ],
                      ),
                    ),
                  ),
                  Divider(),

                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/previewBundal');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Cart",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.shopping_bag,
                            size: 28,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/myorderpage');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order History",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/history.png",
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/bundlecreatorPage",
                          arguments: {'id': '1', 'index': '1'});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create Your Bundle",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/box.png",
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Menulist(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, "/bundlecreatorPage",
                  //         arguments: {'id': '1', 'index': '1'});
                  //   },
                  //   name: 'Create Your Bundle',
                  //   icon: Icons.branding_watermark_rounded,
                  // ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/addressbook",
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address Book",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/map.png",
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ),

                  Divider(),
                  Menulist(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/referral",
                      );
                    },
                    name: 'Refer & Earn',
                    icon: Icons.currency_rupee,
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/cummunityonboard",
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Community",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/community2.png",
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ),

                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/story",
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Story",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/story.png",
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ),

                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/blog",
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Blogs",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/blog.png",
                            height: 35,
                          )
                        ],
                      ),
                    ),
                  ),

                  Divider(),
                  Menulist(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/contact",
                      );
                    },
                    name: 'Contact Us',
                    icon: Icons.contact_mail_outlined,
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/pdf', arguments: {
                        'url':
                            'https://cms.cybertizeweb.com/boxoniq-crm/staticpages/about.pdf',
                        'title': 'About Us'
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About Us",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 12,
                                color: grad2Color,
                                // fontFamily: font,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/about.png",
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  // Menulist(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/pdf', arguments: {
                  //       'url':
                  //           'https://cms.cybertizeweb.com/boxoniq-crm/staticpages/about.pdf',
                  //       'title': 'About Us'
                  //     });
                  //   },
                  //   name: 'About Us',
                  //   icon: Icons.details_outlined,
                  // ),
                  Divider(),
                  Menulist(
                    onTap: () {
                      Navigator.pushNamed(context, '/faq');
                    },
                    name: 'FAQ',
                    icon: Icons.question_answer_outlined,
                  ),
                  Divider(),
                  Menulist(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/policies",
                      );
                    },
                    name: 'Policies',
                    icon: Icons.policy_outlined,
                  ),
                  Divider(),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Customer Support",
                  //             style: TextStyle(
                  //                 letterSpacing: 1,
                  //                 fontSize: 14,
                  //                 color: grad2Color,
                  //                 // fontFamily: font,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           Text(
                  //             "info@boxonic.com",
                  //             style: TextStyle(
                  //                 letterSpacing: 1,
                  //                 fontSize: 10,
                  //                 color: Colors.grey,
                  //                 // fontFamily: font,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //       Image.asset("assets/customer-service (1) 1.png")
                  //     ],
                  //   ),
                  // ),
                  Divider(),
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Row(
                  //     children: [
                  //       Image.asset("assets/user (9) 1.png"),
                  //       Text(
                  //         "  MY DETAILS",
                  //         textAlign: TextAlign.start,
                  //         style: TextStyle(
                  //             letterSpacing: 1,
                  //             fontSize: 14,
                  //             color: Colors.grey,
                  //             // fontFamily: font,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Divider(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     "Mobile Number",
                  //                     style: TextStyle(
                  //                         letterSpacing: 1,
                  //                         fontSize: 12,
                  //                         color: grad2Color,
                  //                         // fontFamily: font,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Icon(Icons.edit, size: 15)
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 snapshot.data!.phone!,
                  //                 style: TextStyle(
                  //                     letterSpacing: 1,
                  //                     fontSize: 10,
                  //                     color: Colors.grey,
                  //                     // fontFamily: font,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       Image.asset("assets/telephone-call (1) 1.png")
                  //     ],
                  //   ),
                  // ),
                  // Divider(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     "Email",
                  //                     style: TextStyle(
                  //                         letterSpacing: 1,
                  //                         fontSize: 12,
                  //                         color: grad2Color,
                  //                         // fontFamily: font,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Icon(Icons.edit, size: 15)
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 snapshot.data!.email!,
                  //                 style: TextStyle(
                  //                     letterSpacing: 1,
                  //                     fontSize: 10,
                  //                     color: Colors.grey,
                  //                     // fontFamily: font,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       Image.asset("assets/gmail (1) 1.png")
                  //     ],
                  //   ),
                  // ),
                  // Divider(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     "My Address",
                  //                     style: TextStyle(
                  //                         letterSpacing: 1,
                  //                         fontSize: 12,
                  //                         color: grad2Color,
                  //                         // fontFamily: font,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Icon(Icons.edit, size: 15)
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width -
                  //                         150,
                  //                 child: Text(
                  //                   snapshot.data!.address!,
                  //                   maxLines: 2,
                  //                   style: TextStyle(
                  //                       letterSpacing: 1,
                  //                       fontSize: 10,
                  //                       color: Colors.grey,
                  //                       // fontFamily: font,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       Image.asset("assets/address 1.png")
                  //     ],
                  //   ),
                  // ),
                  // Divider(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     "Baby Name",
                  //                     style: TextStyle(
                  //                         letterSpacing: 1,
                  //                         fontSize: 12,
                  //                         color: grad2Color,
                  //                         // fontFamily: font,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Icon(Icons.edit, size: 15)
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 "Santosh Kumar",
                  //                 style: TextStyle(
                  //                     letterSpacing: 1,
                  //                     fontSize: 10,
                  //                     color: Colors.grey,
                  //                     // fontFamily: font,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       Image.asset("assets/address 1.png")
                  //     ],
                  //   ),
                  // ),
                  // Divider(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment:
                  //                 CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     "Baby D.O.B",
                  //                     style: TextStyle(
                  //                         letterSpacing: 1,
                  //                         fontSize: 12,
                  //                         color: grad2Color,
                  //                         // fontFamily: font,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Icon(Icons.edit, size: 15)
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 "02/10/2021",
                  //                 style: TextStyle(
                  //                     letterSpacing: 1,
                  //                     fontSize: 10,
                  //                     color: Colors.grey,
                  //                     // fontFamily: font,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //       Image.asset("assets/address 1.png")
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  userCred.logoutUser();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login',
                    ModalRoute.withName('/splashsceen'),
                  );
                },
                child: Container(
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
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ));
  }
}

class Menulist extends StatelessWidget {
  Menulist({Key? key, this.name, this.icon, this.onTap}) : super(key: key);
  String? name;
  IconData? icon;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$name",
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 12,
                  color: grad2Color,
                  // fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
