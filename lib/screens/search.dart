import 'package:boxoniq/api/homeapi.dart';
import 'package:boxoniq/modal/homemodal.dart';
import 'package:boxoniq/repo/bloc/homebloc.dart';
import 'package:boxoniq/shimmer/newshimmer.dart';
import 'package:boxoniq/util/blog.dart';
import 'package:boxoniq/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    homebloc.fetchSerach("");
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
              controller: _searchController,
              onChanged: (s) {
                homebloc.fetchSerach(s);
              },
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
                    // fontFamily: font,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<SearchModal>(
                  stream: homebloc.getSearch.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Billing_shimmer(number: 5, width: 100);
                    return Column(
                      children: [
                        snapshot.data!.data.isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    Lottie.asset('assets/empty.json',
                                        repeat: false, height: 200),
                                    Text('Item Not Found')
                                  ],
                                ),
                              )
                            : Column(
                                children: List.generate(
                                    snapshot.data!.data.length,
                                    (index) => ProductsCard(
                                        appid: _searchController.text,
                                        data: snapshot.data!.data[index],
                                        i: index))),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsCard extends StatefulWidget {
  ProductsCard({Key? key, this.data, this.appid, this.i}) : super(key: key);
  SearchProductModal? data;
  String? appid;
  int colorIndex = 0;
  String attrIdForApi = "";
  int? i;

  @override
  State<ProductsCard> createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  List<String> idArr = [];

  int count = 1;
  String attrId = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idArr.clear();

    print('init v chal rha');

    check();
  }

  check() async {
    Map data = await homeApi.searchinit(widget.appid!) as Map;
    print('yaha se=======');
    print(data);
    // print('${data['product'][0]['attribute'][0]['id']} ////////');
    if (widget.attrIdForApi == "") {
      widget.attrIdForApi = data['product'][widget.i]['attribute'][0]['id'];
    } else if (widget.attrIdForApi !=
        data['product'][widget.i]['attribute'][0]['id']) {
      print('true');
      return;
    } else {
      widget.attrIdForApi = data['product'][widget.i]['attribute'][0]['id'];
      // print('false');
      // print(widget.attrIdForApi);
      // print('${data['product'][0]['attribute'][0]['id']} ');
    }
    print('$widget.attrIdForApi ------attrid');
    print(widget.appid);
  }

  @override
  Widget build(BuildContext context) {
    // check();
    print('build bna bhai');

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/productditels", arguments: {
          'id': widget.data!.id,
          'image': widget.data!.img,
          'title': widget.data!.title,
          'attr': widget.data!.attr
        });
      },
      child: Center(
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
                      child: Image.network(
                        widget.data!.img!,
                        errorBuilder: (context, error, stackTrace) => Image.network(
                            'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-536.jpg?t=st=1648458079~exp=1648458679~hmac=22225d104f55882eeda53ca4bba904e4d687db4db62051a53fc670b06d89a94f&w=740'),
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.data!.title!,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16,
                          color: Colors.black,
                          // fontFamily: font,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 180,
                      child: Text(
                        widget.data!.desc!,
                        maxLines: 4,
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 10,
                          color: Colors.black,
                          // fontFamily: font,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ ${widget.data!.attr[widget.colorIndex].price!}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '₹ ${widget.data!.attr[widget.colorIndex].mrp!}',
                          style: TextStyle(
                            decorationThickness: 2,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff53900F)),
                          child: Text(
                            '${widget.data!.attr[widget.colorIndex].discount!}% off',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 + 30,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              widget.data!.attr.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colorIndex = index;
                                          attrId = widget.data!.attr[index].id
                                              .toString();
                                          widget.attrIdForApi = widget
                                              .data!.attr[index].id
                                              .toString();
                                        });
                                      },
                                      child: Chip(
                                          backgroundColor:
                                              widget.colorIndex == index
                                                  ? lightWhite3
                                                  : Colors.grey[300],
                                          label: Text(
                                            widget.data!.attr[index].name!,
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
                        InkWell(
                          onTap: () async {
                            if (widget.attrIdForApi == "") {
                              Fluttertoast.showToast(
                                  msg: 'Please select Attribute');
                              return;
                            }
                            HomeApi _api = HomeApi();
                            Map data = await _api.addToCart(
                                p_id: widget.data!.id!,
                                attr_id: widget.attrIdForApi,
                                qty: count.toString(),
                                userid: userCred.getUserId());
                            print(data);

                            if (data['response'] == "1") {
                              homebloc.checkamount();
                              setState(() {
                                widget.colorIndex = 0;
                                widget.attrIdForApi = "";
                                idArr.add('${widget.data!.id!}');
                              });

                              Fluttertoast.showToast(
                                  msg: 'Successfully added',
                                  backgroundColor: Colors.green);
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Something went wrong');
                            }
                          },
                          child: idArr.contains('${widget.data!.id!}')
                              ? Container(
                                  // width: 120,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff53900F),
                                    // border: Border.all(color: Colors.blue, width: 1),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Added to box",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 10,
                                          color: Colors.white,
                                          // fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : Container(
                                  // width: 120,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color(0xff53900F),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    // border: Border.all(color: Colors.blue, width: 1),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Add to Box",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 10,
                                          color: Color(0xff53900F),
                                          // fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
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
                        //           // fontFamily: font,
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
                        //                 // fontFamily: font,
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
      ),
    );
  }
}
