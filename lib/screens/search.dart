import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite2,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            )),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: CircleAvatar(
        //       backgroundImage: NetworkImage(
        //         "https://cdn-icons-png.flaticon.com/128/1177/1177568.png",
        //       ),
        //     ),
        //   ),
        // ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Search brands, products & more...",
                  hintStyle: TextStyle(fontSize: 12),
                  // prefixIcon: Icon(Icons.email),
                  border: InputBorder.none),
            ),
          ],
        ),
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
    );
  }
}
